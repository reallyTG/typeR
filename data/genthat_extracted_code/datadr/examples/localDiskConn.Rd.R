library(datadr)


### Name: localDiskConn
### Title: Connect to Data Source on Local Disk
### Aliases: localDiskConn

### ** Examples

# connect to empty localDisk directory
conn <- localDiskConn(file.path(tempdir(), "irisSplit"), autoYes = TRUE)
# add some data
addData(conn, list(list("1", iris[1:10,])))
addData(conn, list(list("2", iris[11:110,])))
addData(conn, list(list("3", iris[111:150,])))
# represent it as a distributed data frame
irisDdf <- ddf(conn, update = TRUE)
irisDdf



