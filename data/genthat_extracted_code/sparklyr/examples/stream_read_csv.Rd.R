library(sparklyr)


### Name: stream_read_csv
### Title: Read CSV Stream
### Aliases: stream_read_csv

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
##D stream <- stream_read_csv(sc, csv_path) %>% stream_write_csv("csv-out")
##D 
##D stream_stop(stream)
##D 
## End(Not run)




