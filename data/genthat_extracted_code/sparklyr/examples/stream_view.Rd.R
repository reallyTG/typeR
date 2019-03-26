library(sparklyr)


### Name: stream_view
### Title: View Stream
### Aliases: stream_view

### ** Examples

## Not run: 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D 
##D dir.create("iris-in")
##D write.csv(iris, "iris-in/iris.csv", row.names = FALSE)
##D 
##D stream_read_csv(sc, "iris-in/") %>%
##D   stream_write_csv("iris-out/") %>%
##D   stream_view() %>%
##D   stream_stop()
## End(Not run)



