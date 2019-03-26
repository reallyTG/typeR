library(sparklyr)


### Name: stream_write_console
### Title: Write Console Stream
### Aliases: stream_write_console

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D sdf_len(sc, 10) %>% dplyr::transmute(text = as.character(id)) %>% spark_write_text("text-in")
##D 
##D stream <- stream_read_text(sc, "text-in") %>% stream_write_console()
##D 
##D stream_stop(stream)
##D 
## End(Not run)




