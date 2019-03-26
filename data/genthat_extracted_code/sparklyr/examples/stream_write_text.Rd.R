library(sparklyr)


### Name: stream_write_text
### Title: Write Text Stream
### Aliases: stream_write_text

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D dir.create("text-in")
##D writeLines("A text entry", "text-in/text.txt")
##D 
##D text_path <- file.path("file://", getwd(), "text-in")
##D 
##D stream <- stream_read_text(sc, text_path) %>% stream_write_text("text-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




