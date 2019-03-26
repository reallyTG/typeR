library(datadr)


### Name: ddf
### Title: Instantiate a Distributed Data Frame ('ddf')
### Aliases: ddf

### ** Examples

# in-memory ddf
d <- ddf(iris)
d

# local disk ddf
conn <- localDiskConn(tempfile(), autoYes = TRUE)
addData(conn, list(list("1", iris[1:10,])))
addData(conn, list(list("2", iris[11:110,])))
addData(conn, list(list("3", iris[111:150,])))
dl <- ddf(conn)
dl

# hdfs ddf (requires RHIPE / Hadoop)
## Not run: 
##D   # connect to empty HDFS directory
##D   conn <- hdfsConn("/tmp/irisSplit")
##D   # add some data
##D   addData(conn, list(list("1", iris[1:10,])))
##D   addData(conn, list(list("2", iris[11:110,])))
##D   addData(conn, list(list("3", iris[111:150,])))
##D   # represent it as a distributed data frame
##D   hdd <- ddf(conn)
## End(Not run)



