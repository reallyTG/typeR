library(sparklyr)


### Name: stream_read_parquet
### Title: Read Parquet Stream
### Aliases: stream_read_parquet

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D sdf_len(sc, 10) %>% spark_write_parquet("parquet-in")
##D 
##D stream <- stream_read_parquet(sc, "parquet-in") %>% stream_write_parquet("parquet-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




