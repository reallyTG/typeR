library(dwapi)


### Name: update_table_schema
### Title: Update table schema.
### Aliases: update_table_schema

### ** Examples

field_update_req <- dwapi::table_schema_field_update_request("field", "new desc")
schema_update_req <- dwapi::table_schema_update_request(c(field_update_req))
## Not run: 
##D   dwapi::update_table_schema("user/dataset", "table", schema_update_req)
## End(Not run)



