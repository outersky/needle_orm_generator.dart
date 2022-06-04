// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// NeedleOrmMetaInfoGenerator
// **************************************************************************

abstract class __Model extends Model {
  // abstract begin

  String get __tableName;
  String? get __idFieldName;

  dynamic __getField(String fieldName, {errorOnNonExistField: true});
  void __setField(String fieldName, dynamic value,
      {errorOnNonExistField: true});

  // abstract end

  // mark whether this instance is loaded from db.
  bool __isLoadedFromDb = false;

  // mark all modified fields after loaded
  final __dirtyFields = <String>{};

  void loadMap(Map<String, dynamic> m, {errorOnNonExistField: false}) {
    m.forEach((key, value) {
      __setField(key, value, errorOnNonExistField: errorOnNonExistField);
    });
  }

  void __markDirty(String fieldName) {
    __dirtyFields.add(fieldName);
  }

  void __cleanDirty() {
    __dirtyFields.clear();
  }

  String __dirtyValues() {
    return __dirtyFields
        .map((e) => "${e.toLowerCase()} : ${__getField(e)}")
        .join(", ");
  }

  BaseModelQuery get __query => _modelInspector.newQuery(className);

  Future<void> insert() async {
    __prePersist();
    await __query.insert(this);
    __postPersist();
  }

  Future<void> update() async {
    __preUpdate();
    await __query.update(this);
    __postUpdate();
  }

  Future<void> save() async {
    if (__idFieldName == null) throw 'no @ID field';

    if (__getField(__idFieldName!) != null) {
      await update();
    } else {
      await insert();
    }
  }

  Future<void> delete() async {
    __preRemove();
    await __query.delete(this);
    __postRemove();
  }

  Future<void> deletePermanent() async {
    __preRemovePermanent();
    await __query.deletePermanent(this);
    __postRemovePermanent();
  }

  void __prePersist() {}
  void __preUpdate() {}
  void __preRemove() {}
  void __preRemovePermanent() {}
  void __postPersist() {}
  void __postUpdate() {}
  void __postRemove() {}
  void __postRemovePermanent() {}
  void __postLoad() {}
}

/// support toMap(fields:'*'), toMap(fields:'name,price,author(*),editor(name,email)')
class FieldFilter {
  final String fields;

  List<String> _fieldList = [];

  List<String> get fieldList => List.of(_fieldList);

  FieldFilter(this.fields) {
    _fieldList = _parseFields();
  }

  bool contains(String field, {String? idField}) {
    if (shouldIncludeIdFields()) {
      if (field == idField) {
        return true;
      }
    }
    return fieldList.any(
        (name) => name == '*' || name == field || name.startsWith('$field('));
  }

  bool shouldIncludeIdFields() {
    return fields.trim().isEmpty;
  }

  String subFilter(String field) {
    List<String> subList = fieldList
        .where((name) => name == field || name.startsWith('$field('))
        .toList();
    if (subList.isEmpty) {
      return '';
    }
    var str = subList.first;
    int i = str.indexOf('(');
    if (i != -1) {
      return str.substring(i + 1, str.length - 1);
    }
    return '';
  }

  List<String> _parseFields() {
    var result = <String>[];
    var str = fields.trim().replaceAll(' ', '');
    int j = 0;
    for (int i = 1; i < str.length; i++) {
      if (str[i] == ',') {
        result.add(str.substring(j, i));
        j = i + 1;
      } else if (str[i] == '(') {
        int k = _readTillParenthesisEnd(str, i + 1);
        if (k == -1) {
          throw '( and ) do NOT match';
        }
        i = k;
      }
    }
    if (j < str.length) {
      result.add(str.substring(j));
    }
    return result;
  }

  int _readTillParenthesisEnd(String str, int index) {
    int left = 1;
    for (; index < str.length; index++) {
      if (str[index] == ')') {
        left--;
      } else if (str[index] == '(') {
        left++;
      }
      if (left == 0) {
        return index;
      }
    }
    return -1;
  }
}

abstract class _BaseModelQuery<T extends __Model, D>
    extends BaseModelQuery<T, D> {
  _BaseModelQuery({BaseModelQuery? topQuery, String? propName})
      : super(_modelInspector, sqlExecutor,
            topQuery: topQuery, propName: propName);
}

class _ModelInspector extends ModelInspector<__Model> {
  @override
  String getClassName(__Model obj) {
    if (obj is Book) return 'Book';
    if (obj is User) return 'User';
    if (obj is Job) return 'Job';
    throw 'unknown entity : $obj';
  }

  @override
  get allOrmMetaClasses => _allOrmClasses;

  @override
  OrmMetaClass? meta(String className) {
    var list =
        _allOrmClasses.where((element) => element.name == className).toList();
    if (list.isNotEmpty) {
      return list.first;
    }
    return null;
  }

  @override
  dynamic getFieldValue(__Model obj, String fieldName) {
    return obj.__getField(fieldName);
  }

  @override
  void setFieldValue(__Model obj, String fieldName, dynamic value) {
    obj.__setField(fieldName, value);
  }

  @override
  Map<String, dynamic> getDirtyFields(__Model model) {
    var map = <String, dynamic>{};
    model.__dirtyFields.forEach((name) {
      map[name] = model.__getField(name);
    });
    return map;
  }

  @override
  void loadModel(__Model model, Map<String, dynamic> m,
      {errorOnNonExistField: false}) {
    model.loadMap(m, errorOnNonExistField: false);
    model.__isLoadedFromDb = true;
    model.__cleanDirty();
  }

  @override
  __Model newInstance(String className) {
    switch (className) {
      case 'Book':
        return Book();
      case 'User':
        return User();
      case 'Job':
        return Job();
      default:
        throw 'unknown class : $className';
    }
  }

  BaseModelQuery newQuery(String name) {
    switch (name) {
      case 'Book':
        return BookModelQuery();
      case 'User':
        return UserModelQuery();
      case 'Job':
        return JobModelQuery();
    }
    throw 'Unknow Query Name: $name';
  }
}

final _ModelInspector _modelInspector = _ModelInspector();

class _SqlExecutor extends SqlExecutor<__Model> {
  _SqlExecutor() : super(_ModelInspector());

  @override
  Future<List<List>> query(
      String tableName, String query, Map<String, dynamic> substitutionValues,
      [List<String> returningFields = const []]) {
    return _globalDs.execute(
        tableName, query, substitutionValues, returningFields);
  }
}

final sqlExecutor = _SqlExecutor();

class OrmMetaInfoBaseModel extends OrmMetaClass {
  OrmMetaInfoBaseModel()
      : super('BaseModel', _modelInspector,
            isAbstract: true,
            superClassName: 'Object',
            ormAnnotations: [
              Entity(),
            ],
            fields: [
              OrmMetaField('id', 'int?', ormAnnotations: [
                ID(),
              ]),
              OrmMetaField('version', 'int?', ormAnnotations: [
                Version(),
              ]),
              OrmMetaField('deleted', 'bool?', ormAnnotations: [
                SoftDelete(),
              ]),
              OrmMetaField('createdAt', 'DateTime?', ormAnnotations: [
                WhenCreated(),
              ]),
              OrmMetaField('updatedAt', 'DateTime?', ormAnnotations: [
                WhenModified(),
              ]),
              OrmMetaField('createdBy', 'String?', ormAnnotations: [
                WhoCreated(),
              ]),
              OrmMetaField('lastUpdatedBy', 'String?', ormAnnotations: [
                WhoModified(),
              ]),
              OrmMetaField('remark', 'String?', ormAnnotations: [
                Column(),
              ]),
            ]);
}

class OrmMetaInfoBook extends OrmMetaClass {
  OrmMetaInfoBook()
      : super('Book', _modelInspector,
            isAbstract: false,
            superClassName: 'BaseModel',
            ormAnnotations: [
              Table(),
              Entity(ds: "mysql_example_db"),
            ],
            fields: [
              OrmMetaField('title', 'String?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('price', 'double?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('author', 'User?', ormAnnotations: [
                ManyToOne(),
              ]),
            ]);
}

class OrmMetaInfoUser extends OrmMetaClass {
  OrmMetaInfoUser()
      : super('User', _modelInspector,
            isAbstract: false,
            superClassName: 'BaseModel',
            ormAnnotations: [
              Table(name: 'users'),
              Entity(
                  ds: Entity.DEFAULT_DS,
                  prePersist: 'beforeInsert',
                  postPersist: 'afterInsert'),
            ],
            fields: [
              OrmMetaField('name', 'String?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('loginName', 'String?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('address', 'String?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('age', 'int?', ormAnnotations: [
                Column(),
              ]),
              OrmMetaField('books', 'List<_Book>?', ormAnnotations: [
                OneToMany(mappedBy: "_author"),
              ]),
            ]);
}

class OrmMetaInfoJob extends OrmMetaClass {
  OrmMetaInfoJob()
      : super('Job', _modelInspector,
            isAbstract: false,
            superClassName: 'BaseModel',
            ormAnnotations: [
              Entity(),
            ],
            fields: [
              OrmMetaField('name', 'String?', ormAnnotations: [
                Column(),
              ]),
            ]);
}

final _allOrmClasses = [
  OrmMetaInfoBaseModel(),
  OrmMetaInfoBook(),
  OrmMetaInfoUser(),
  OrmMetaInfoJob()
];

// **************************************************************************
// NeedleOrmModelGenerator
// **************************************************************************

class BaseModelModelQuery extends _BaseModelQuery<BaseModel, int> {
  @override
  String get className => 'BaseModel';

  BaseModelModelQuery({_BaseModelQuery? topQuery, String? propName})
      : super(topQuery: topQuery, propName: propName);

  IntColumn id = IntColumn("id");
  IntColumn version = IntColumn("version");
  BoolColumn deleted = BoolColumn("deleted");
  DateTimeColumn createdAt = DateTimeColumn("createdAt");
  DateTimeColumn updatedAt = DateTimeColumn("updatedAt");
  StringColumn createdBy = StringColumn("createdBy");
  StringColumn lastUpdatedBy = StringColumn("lastUpdatedBy");
  StringColumn remark = StringColumn("remark");

  List<ColumnQuery> get columns => [
        id,
        version,
        deleted,
        createdAt,
        updatedAt,
        createdBy,
        lastUpdatedBy,
        remark
      ];

  List<BaseModelQuery> get joins => [];
}

abstract class BaseModel extends __Model {
  int? _id;
  int? get id => _id;
  set id(int? v) {
    _id = v;
    __markDirty('id');
  }

  int? _version;
  int? get version => _version;
  set version(int? v) {
    _version = v;
    __markDirty('version');
  }

  bool? _deleted;
  bool? get deleted => _deleted;
  set deleted(bool? v) {
    _deleted = v;
    __markDirty('deleted');
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? v) {
    _createdAt = v;
    __markDirty('createdAt');
  }

  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? v) {
    _updatedAt = v;
    __markDirty('updatedAt');
  }

  String? _createdBy;
  String? get createdBy => _createdBy;
  set createdBy(String? v) {
    _createdBy = v;
    __markDirty('createdBy');
  }

  String? _lastUpdatedBy;
  String? get lastUpdatedBy => _lastUpdatedBy;
  set lastUpdatedBy(String? v) {
    _lastUpdatedBy = v;
    __markDirty('lastUpdatedBy');
  }

  String? _remark;
  String? get remark => _remark;
  set remark(String? v) {
    _remark = v;
    __markDirty('remark');
  }

  BaseModel();

  @override
  String get className => 'BaseModel';

  static BaseModelModelQuery get Query => BaseModelModelQuery();

  @override
  dynamic __getField(String fieldName, {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "id":
        return _id;
      case "version":
        return _version;
      case "deleted":
        return _deleted;
      case "createdAt":
        return _createdAt;
      case "updatedAt":
        return _updatedAt;
      case "createdBy":
        return _createdBy;
      case "lastUpdatedBy":
        return _lastUpdatedBy;
      case "remark":
        return _remark;
      default:
        if (errorOnNonExistField) {
          throw 'class _BaseModel has now such field: $fieldName';
        }
    }
  }

  @override
  void __setField(String fieldName, dynamic value,
      {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "id":
        id = value;
        break;
      case "version":
        version = value;
        break;
      case "deleted":
        deleted = value;
        break;
      case "createdAt":
        createdAt = value;
        break;
      case "updatedAt":
        updatedAt = value;
        break;
      case "createdBy":
        createdBy = value;
        break;
      case "lastUpdatedBy":
        lastUpdatedBy = value;
        break;
      case "remark":
        remark = value;
        break;
      default:
        if (errorOnNonExistField) {
          throw 'class _BaseModel has now such field: $fieldName';
        }
    }
  }

  @override
  Map<String, dynamic> toMap({String fields = '*', bool ignoreNull = true}) {
    var filter = FieldFilter(fields);
    if (ignoreNull) {
      var m = <String, dynamic>{};
      _id != null && filter.contains("id", idField: __idFieldName)
          ? m["id"] = _id
          : "";
      _version != null && filter.contains("version", idField: __idFieldName)
          ? m["version"] = _version
          : "";
      _deleted != null && filter.contains("deleted", idField: __idFieldName)
          ? m["deleted"] = _deleted
          : "";
      _createdAt != null && filter.contains("createdAt", idField: __idFieldName)
          ? m["createdAt"] = _createdAt?.toIso8601String()
          : "";
      _updatedAt != null && filter.contains("updatedAt", idField: __idFieldName)
          ? m["updatedAt"] = _updatedAt?.toIso8601String()
          : "";
      _createdBy != null && filter.contains("createdBy", idField: __idFieldName)
          ? m["createdBy"] = _createdBy
          : "";
      _lastUpdatedBy != null &&
              filter.contains("lastUpdatedBy", idField: __idFieldName)
          ? m["lastUpdatedBy"] = _lastUpdatedBy
          : "";
      _remark != null && filter.contains("remark", idField: __idFieldName)
          ? m["remark"] = _remark
          : "";

      return m;
    }
    return {
      if (filter.contains('id', idField: __idFieldName)) "id": _id,
      if (filter.contains('version', idField: __idFieldName))
        "version": _version,
      if (filter.contains('deleted', idField: __idFieldName))
        "deleted": _deleted,
      if (filter.contains('createdAt', idField: __idFieldName))
        "createdAt": _createdAt?.toIso8601String(),
      if (filter.contains('updatedAt', idField: __idFieldName))
        "updatedAt": _updatedAt?.toIso8601String(),
      if (filter.contains('createdBy', idField: __idFieldName))
        "createdBy": _createdBy,
      if (filter.contains('lastUpdatedBy', idField: __idFieldName))
        "lastUpdatedBy": _lastUpdatedBy,
      if (filter.contains('remark', idField: __idFieldName)) "remark": _remark,
    };
  }

  @override
  String get __tableName {
    return "basemodel";
  }

  @override
  String? get __idFieldName {
    return "id";
  }
}

class BookModelQuery extends BaseModelModelQuery {
  @override
  String get className => 'Book';

  BookModelQuery({_BaseModelQuery? topQuery, String? propName})
      : super(topQuery: topQuery, propName: propName);

  StringColumn title = StringColumn("title");
  DoubleColumn price = DoubleColumn("price");
  UserModelQuery get author => topQuery.findQuery("User", "author");

  List<ColumnQuery> get columns => [title, price];

  List<BaseModelQuery> get joins => [author];
}

class Book extends BaseModel {
  String? _title;
  String? get title => _title;
  set title(String? v) {
    _title = v;
    __markDirty('title');
  }

  double? _price;
  double? get price => _price;
  set price(double? v) {
    _price = v;
    __markDirty('price');
  }

  User? _author;
  User? get author => _author;
  set author(User? v) {
    _author = v;
    __markDirty('author');
  }

  Book();

  @override
  String get className => 'Book';

  static BookModelQuery get Query => BookModelQuery();

  @override
  dynamic __getField(String fieldName, {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "title":
        return _title;
      case "price":
        return _price;
      case "author":
        return _author;
      default:
        return super
            .__getField(fieldName, errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  void __setField(String fieldName, dynamic value,
      {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "title":
        title = value;
        break;
      case "price":
        price = value;
        break;
      case "author":
        author = value;
        break;
      default:
        super.__setField(fieldName, value,
            errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  Map<String, dynamic> toMap({String fields = '*', bool ignoreNull = true}) {
    var filter = FieldFilter(fields);
    if (ignoreNull) {
      var m = <String, dynamic>{};
      _title != null && filter.contains("title", idField: __idFieldName)
          ? m["title"] = _title
          : "";
      _price != null && filter.contains("price", idField: __idFieldName)
          ? m["price"] = _price
          : "";
      _author != null && filter.contains("author", idField: __idFieldName)
          ? m["author"] = _author?.toMap(
              fields: filter.subFilter("author"), ignoreNull: ignoreNull)
          : "";
      m.addAll(super.toMap(fields: fields, ignoreNull: true));
      return m;
    }
    return {
      if (filter.contains('title', idField: __idFieldName)) "title": _title,
      if (filter.contains('price', idField: __idFieldName)) "price": _price,
      if (filter.contains('author', idField: __idFieldName))
        "author": _author?.toMap(
            fields: filter.subFilter("author"), ignoreNull: ignoreNull),
      ...super.toMap(fields: fields, ignoreNull: ignoreNull),
    };
  }

  @override
  String get __tableName {
    return "book";
  }

  @override
  String? get __idFieldName {
    return "id";
  }
}

class UserModelQuery extends BaseModelModelQuery {
  @override
  String get className => 'User';

  UserModelQuery({_BaseModelQuery? topQuery, String? propName})
      : super(topQuery: topQuery, propName: propName);

  StringColumn name = StringColumn("name");
  StringColumn loginName = StringColumn("loginName");
  StringColumn address = StringColumn("address");
  IntColumn age = IntColumn("age");
  BookModelQuery get books => topQuery.findQuery("Book", "books");

  List<ColumnQuery> get columns => [name, loginName, address, age];

  List<BaseModelQuery> get joins => [books];
}

class User extends BaseModel {
  String? _name;
  String? get name => _name;
  set name(String? v) {
    _name = v;
    __markDirty('name');
  }

  String? _loginName;
  String? get loginName => _loginName;
  set loginName(String? v) {
    _loginName = v;
    __markDirty('loginName');
  }

  String? _address;
  String? get address => _address;
  set address(String? v) {
    _address = v;
    __markDirty('address');
  }

  int? _age;
  int? get age => _age;
  set age(int? v) {
    _age = v;
    __markDirty('age');
  }

  List<Book>? _books;
  List<Book>? get books => _books;
  set books(List<Book>? v) {
    _books = v;
    __markDirty('books');
  }

  User();

  @override
  String get className => 'User';

  static UserModelQuery get Query => UserModelQuery();

  @override
  dynamic __getField(String fieldName, {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "name":
        return _name;
      case "loginName":
        return _loginName;
      case "address":
        return _address;
      case "age":
        return _age;
      case "books":
        return _books;
      default:
        return super
            .__getField(fieldName, errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  void __setField(String fieldName, dynamic value,
      {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "name":
        name = value;
        break;
      case "loginName":
        loginName = value;
        break;
      case "address":
        address = value;
        break;
      case "age":
        age = value;
        break;
      case "books":
        books = value;
        break;
      default:
        super.__setField(fieldName, value,
            errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  Map<String, dynamic> toMap({String fields = '*', bool ignoreNull = true}) {
    var filter = FieldFilter(fields);
    if (ignoreNull) {
      var m = <String, dynamic>{};
      _name != null && filter.contains("name", idField: __idFieldName)
          ? m["name"] = _name
          : "";
      _loginName != null && filter.contains("loginName", idField: __idFieldName)
          ? m["loginName"] = _loginName
          : "";
      _address != null && filter.contains("address", idField: __idFieldName)
          ? m["address"] = _address
          : "";
      _age != null && filter.contains("age", idField: __idFieldName)
          ? m["age"] = _age
          : "";
      _books != null && filter.contains("books", idField: __idFieldName)
          ? m["books"] = _books
          : "";
      m.addAll(super.toMap(fields: fields, ignoreNull: true));
      return m;
    }
    return {
      if (filter.contains('name', idField: __idFieldName)) "name": _name,
      if (filter.contains('loginName', idField: __idFieldName))
        "loginName": _loginName,
      if (filter.contains('address', idField: __idFieldName))
        "address": _address,
      if (filter.contains('age', idField: __idFieldName)) "age": _age,
      if (filter.contains('books', idField: __idFieldName)) "books": _books,
      ...super.toMap(fields: fields, ignoreNull: ignoreNull),
    };
  }

  @override
  String get __tableName {
    return "user";
  }

  @override
  String? get __idFieldName {
    return "id";
  }

  @override
  void __prePersist() {
    beforeInsert();
  }

  @override
  void __postPersist() {
    afterInsert();
  }
}

class JobModelQuery extends BaseModelModelQuery {
  @override
  String get className => 'Job';

  JobModelQuery({_BaseModelQuery? topQuery, String? propName})
      : super(topQuery: topQuery, propName: propName);

  StringColumn name = StringColumn("name");

  List<ColumnQuery> get columns => [name];

  List<BaseModelQuery> get joins => [];
}

class Job extends BaseModel {
  String? _name;
  String? get name => _name;
  set name(String? v) {
    _name = v;
    __markDirty('name');
  }

  Job();

  @override
  String get className => 'Job';

  static JobModelQuery get Query => JobModelQuery();

  @override
  dynamic __getField(String fieldName, {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "name":
        return _name;
      default:
        return super
            .__getField(fieldName, errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  void __setField(String fieldName, dynamic value,
      {errorOnNonExistField: true}) {
    switch (fieldName) {
      case "name":
        name = value;
        break;
      default:
        super.__setField(fieldName, value,
            errorOnNonExistField: errorOnNonExistField);
    }
  }

  @override
  Map<String, dynamic> toMap({String fields = '*', bool ignoreNull = true}) {
    var filter = FieldFilter(fields);
    if (ignoreNull) {
      var m = <String, dynamic>{};
      _name != null && filter.contains("name", idField: __idFieldName)
          ? m["name"] = _name
          : "";
      m.addAll(super.toMap(fields: fields, ignoreNull: true));
      return m;
    }
    return {
      if (filter.contains('name', idField: __idFieldName)) "name": _name,
      ...super.toMap(fields: fields, ignoreNull: ignoreNull),
    };
  }

  @override
  String get __tableName {
    return "job";
  }

  @override
  String? get __idFieldName {
    return "id";
  }
}
