library(sparklyr)


### Name: stream_write_memory
### Title: Write Memory Stream
### Aliases: stream_write_memory

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D dir.create("csv-in")
##D write.csv(iris, "csv-in/data.csv", row.names = FALSE)
##D 
##D csv_path <- file.path("file://", getwd(), "csv-in")
##D 
##D stream <- stream_read_csv(sc, csv_path) %>% stream_write_memory("csv-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




