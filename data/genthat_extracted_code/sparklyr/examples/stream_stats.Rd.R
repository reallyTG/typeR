library(sparklyr)


### Name: stream_stats
### Title: Stream Statistics
### Aliases: stream_stats

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D sdf_len(sc, 10) %>%
##D   spark_write_parquet(path = "parquet-in")
##D 
##D stream <- stream_read_parquet(sc, "parquet-in") %>%
##D  stream_write_parquet("parquet-out")
##D 
##D stream_stats(stream)
## End(Not run)




