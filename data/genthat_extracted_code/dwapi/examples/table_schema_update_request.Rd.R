library(dwapi)


### Name: table_schema_update_request
### Title: Create request object for updating table schema.
### Aliases: table_schema_update_request

### ** Examples

field_update_req <- dwapi::table_schema_field_update_request("field", "new desc")
schema_update_req <- dwapi::table_schema_update_request(c(field_update_req))



