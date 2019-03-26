library(tableschema.r)


### Name: Schema.load
### Title: Instantiate 'Schema' class
### Aliases: Schema.load

### ** Examples

SCHEMA <- '{"fields": [
  {"name": "id", "type": "string", "constraints": {"required": true}},
  {"name": "height", "type": "number"},
  {"name": "age", "type": "integer"},
  {"name": "name", "type": "string", "constraints": {"required": true}},
  {"name": "occupation", "type": "string"}
  ]}'

# instantiate Schema class
def  = Schema.load(descriptor = SCHEMA)
schema = future::value(def)

# correct number of fields
length(schema$fields)

# correct field names
schema$fieldNames

# convert row
row = list('string', '10.0', '1', 'string', 'string')
castRow = schema$castRow(row)
castRow

SCHEMA_MIN <- '{
"fields": [
  {"name": "id"},
  {"name": "height"}
  ]}'

# load schema
def2  = Schema.load(descriptor = SCHEMA_MIN)
schema2 = future::value(def2)
  
# set default types if not provided
schema2$fields[[1]]$type
schema2$fields[[2]]$type

# fields are not required by default
schema2$fields[[1]]$required
schema2$fields[[2]]$required


#work in strict mode
descriptor = '{"fields": [{"name": "name", "type": "string"}]}'
def3  = Schema.load(descriptor = descriptor, strict = TRUE)
schema3 = future::value(def3)
schema3$valid

# work in non-strict mode
descriptor = '{"fields": [{"name": "name", "type": "string"}]}'
def4 = Schema.load(descriptor = descriptor, strict = FALSE)
schema4 = future::value(def4)
schema4$valid

# work with primary/foreign keys as arrays
descriptor2 = '{
"fields": [{"name": "name"}],
"primaryKey": ["name"],
"foreignKeys": [{
  "fields": ["parent_id"],
  "reference": {"resource": "resource", "fields": ["id"]}
}]}'

def5 = Schema.load(descriptor2)
schema5 = future::value(def5)

schema5$primaryKey
schema5$foreignKeys


# work with primary/foreign keys as string
descriptor3 = '{
"fields": [{"name": "name"}],
"primaryKey": "name",
"foreignKeys": [{
  "fields": "parent_id",
  "reference": {"resource": "resource", "fields": "id"}
}]}'

def6 = Schema.load(descriptor3)
schema6 = future::value(def6)
schema6$primaryKey
schema6$foreignKeys




