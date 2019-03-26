library(GeoMongo)


### Name: json_schema_validator
### Title: simple way to validate a json instance under a given schema
### Aliases: json_schema_validator

### ** Examples


library(GeoMongo)

if (reticulate::py_available() && reticulate::py_module_available("jsonschema")) {

 schema_dict = list("type" = "object",

                      "properties" = list(

                        "name" = list("type" = "string"),

                           "location" = list("type" = "object",

                           "properties" = list(

                            "type" = list("enum" = c("Point", "Polygon")),

                            "coordinates" = list("type" = "array")
 ))))


 data_dict = list("name" = "example location",

                 "location" = list("type" = "Point", "coordinates" = c(-120.24, 39.21)))


 json_schema_validator(json_data = data_dict, json_schema = schema_dict)

}




