library(datadr)


### Name: makeExtractable
### Title: Take a ddo/ddf HDFS data object and turn it into a mapfile
### Aliases: makeExtractable

### ** Examples

## Not run: 
##D   conn <- hdfsConn("/test/irisSplit")
##D   # add some data
##D   addData(conn, list(list("1", iris[1:10,])))
##D   addData(conn, list(list("2", iris[11:110,])))
##D   addData(conn, list(list("3", iris[111:150,])))
##D   # represent it as a distributed data frame
##D   hdd <- ddf(conn)
##D   # try to extract values by key (this will result in an error)
##D   # (HDFS can only lookup key-value pairs by key if data is in a mapfile)
##D   hdd[["3"]]
##D   # convert hdd into a mapfile
##D   hdd <- makeExtractable(hdd)
##D   # try again
##D   hdd[["3"]]
## End(Not run)



