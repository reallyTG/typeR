library(sparklyr)


### Name: stream_find
### Title: Find Stream
### Aliases: stream_find

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D sdf_len(sc, 10) %>%
##D   spark_write_parquet(path = "parquet-in")
##D 
##D stream <- stream_read_parquet(sc, "parquet-in") %>%
##D  stream_write_parquet("parquet-out")
##D 
##D stream_id <- stream_id(stream)
##D stream_find(sc, stream_id)
## End(Not run)




