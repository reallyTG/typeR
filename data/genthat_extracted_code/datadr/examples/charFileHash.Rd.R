library(datadr)


### Name: charFileHash
### Title: Character File Hash Function
### Aliases: charFileHash

### ** Examples

# connect to empty localDisk directory
path <- file.path(tempdir(), "irisSplit")
unlink(path, recursive = TRUE)
conn <- localDiskConn(path, autoYes = TRUE, fileHashFn = charFileHash)
# add some data
addData(conn, list(list("key1", iris[1:10,])))
addData(conn, list(list("key2", iris[11:110,])))
addData(conn, list(list("key3", iris[111:150,])))
# see that files were stored by their key
list.files(path)



