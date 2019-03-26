library(sparklyr)


### Name: stream_read_scoket
### Title: Read Socket Stream
### Aliases: stream_read_scoket

### ** Examples

## Not run: 
##D 
##D sc <- spark_connect(master = "local")
##D 
##D # Start socket server from terminal, example: nc -lk 9999
##D stream <- stream_read_scoket(sc, options = list(host = "localhost", port = 9999))
##D stream
##D 
## End(Not run)




