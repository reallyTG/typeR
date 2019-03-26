library(sparklyr)


### Name: stream_write_orc
### Title: Write a ORC Stream
### Aliases: stream_write_orc

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D sdf_len(sc, 10) %>% spark_write_orc("orc-in")
##D 
##D stream <- stream_read_orc(sc, "orc-in") %>% stream_write_orc("orc-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




