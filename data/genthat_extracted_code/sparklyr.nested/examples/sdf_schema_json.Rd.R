library(sparklyr.nested)


### Name: sdf_schema_json
### Title: Work with the schema
### Aliases: sdf_schema_json sdf_schema_viewer

### ** Examples

## Not run: 
##D library(testthat)
##D library(jsonlite)
##D library(sparklyr)
##D library(sparklyr.nested)
##D sample_json <- paste0(
##D   '{"aircraft_id":["string"],"phase_sequence":["string"],"phases (array)":{"start_point (struct)":',
##D   '{"segment_phase":["string"],"agl":["double"],"elevation":["double"],"time":["long"],',
##D   '"latitude":["double"],"longitude":["double"],"altitude":["double"],"course":["double"],',
##D   '"speed":["double"],"source_point_keys (array)":["[string]"],"primary_key":["string"]},',
##D   '"end_point (struct)":{"segment_phase":["string"],"agl":["double"],"elevation":["double"],',
##D   '"time":["long"],"latitude":["double"],"longitude":["double"],"altitude":["double"],',
##D   '"course":["double"],"speed":["double"],"source_point_keys (array)":["[string]"],',
##D   '"primary_key":["string"]},"phase":["string"],"primary_key":["string"]},"primary_key":["string"]}'
##D )
##D 
##D with_mock(
##D   # I am mocking functions so that the example works without a real spark connection
##D   spark_read_parquet = function(x, ...){return("this is a spark dataframe")},
##D   sdf_schema_json = function(x, ...){return(fromJSON(sample_json))},
##D   spark_connect = function(...){return("this is a spark connection")},
##D   
##D   # the meat of the example is here
##D   sc <- spark_connect(),
##D   spark_data <- spark_read_parquet(sc, path="path/to/data/*.parquet", name="some_name"),
##D   sdf_schema_viewer(spark_data)
##D )
## End(Not run)



