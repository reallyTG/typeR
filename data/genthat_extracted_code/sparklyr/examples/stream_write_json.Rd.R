library(sparklyr)


### Name: stream_write_json
### Title: Write JSON Stream
### Aliases: stream_write_json

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D dir.create("json-in")
##D jsonlite::write_json(list(a = c(1,2), b = c(10,20)), "json-in/data.json")
##D 
##D json_path <- file.path("file://", getwd(), "json-in")
##D 
##D stream <- stream_read_json(sc, json_path) %>% stream_write_json("json-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




