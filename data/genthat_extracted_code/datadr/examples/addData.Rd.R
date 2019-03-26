library(datadr)


### Name: addData
### Title: Add Key-Value Pairs to a Data Connection
### Aliases: addData

### ** Examples

## Not run: 
##D   # connect to empty HDFS directory
##D   conn <- hdfsConn("/test/irisSplit")
##D   # add some data
##D   addData(conn, list(list("1", iris[1:10,])))
##D   addData(conn, list(list("2", iris[11:110,])))
##D   addData(conn, list(list("3", iris[111:150,])))
##D   # represent it as a distributed data frame
##D   hdd <- ddf(conn)
## End(Not run)



