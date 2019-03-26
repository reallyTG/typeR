library(sparklyr)


### Name: stream_render
### Title: Render Stream
### Aliases: stream_render

### ** Examples

## Not run: 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D 
##D dir.create("iris-in")
##D write.csv(iris, "iris-in/iris.csv", row.names = FALSE)
##D 
##D stream <- stream_read_csv(sc, "iris-in/") %>%
##D   stream_write_csv("iris-out/")
##D 
##D stream_render(stream)
##D stream_stop(stream)
## End(Not run)



