library(datadr)


### Name: removeData
### Title: Remove Key-Value Pairs from a Data Connection
### Aliases: removeData

### ** Examples

# connect to empty localDisk directory
conn <- localDiskConn(file.path(tempdir(), "irisSplit"), autoYes = TRUE)
# add some data
addData(conn, list(list("1", iris[1:10,])))
addData(conn, list(list("2", iris[11:90,])))
addData(conn, list(list("3", iris[91:110,])))
addData(conn, list(list("4", iris[111:150,])))
# represent it as a distributed data frame
irisDdf <- ddf(conn, update = TRUE)
irisDdf
# remove data for keys "1" and "2"
removeData(conn, list("1", "2"))
# look at result with updated attributes (reset = TRUE removes previous attrs)
irisDdf <- ddf(conn, reset = TRUE, update = TRUE)
irisDdf



