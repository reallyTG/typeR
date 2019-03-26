library(tableschema.r)


### Name: Table.load
### Title: Instantiate 'Table' class
### Aliases: Table.load

### ** Examples


# define source
SOURCE = '[
["id", "height", "age", "name", "occupation"],
[1, "10.0", 1, "string1", "2012-06-15 00:00:00"],
[2, "10.1", 2, "string2", "2013-06-15 01:00:00"],
[3, "10.2", 3, "string3", "2014-06-15 02:00:00"],
[4, "10.3", 4, "string4", "2015-06-15 03:00:00"],
[5, "10.4", 5, "string5", "2016-06-15 04:00:00"]
]'

# define schema
SCHEMA = '{
  "fields": [
    {"name": "id", "type": "integer", "constraints": {"required": true}},
    {"name": "height", "type": "number"},
    {"name": "age", "type": "integer"},
    {"name": "name", "type": "string", "constraints": {"unique": true}},
    {"name": "occupation", "type": "datetime", "format": "any"}
    ],
  "primaryKey": "id"
}' 


def = Table.load(jsonlite::fromJSON(SOURCE, simplifyVector = FALSE), schema = SCHEMA)
table = future::value(def)

# work with list source
rows = table$read()

# read source data and limit rows
rows2 = table$read(limit = 1)

# read source data and return keyed rows
rows3 = table$read(limit = 1, keyed = TRUE)

# read source data and return extended rows
rows4 = table$read(limit = 1, extended = TRUE)


# work with Schema instance
 def1  =  Schema.load(SCHEMA)
 schema = future::value(def1)
 def2  = Table.load(jsonlite::fromJSON(SOURCE, simplifyVector = FALSE), schema = schema)
 table2 = future::value(def2)
 rows5 = table2$read()
 




