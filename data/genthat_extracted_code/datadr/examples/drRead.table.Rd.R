library(datadr)


### Name: drRead.table
### Title: Data Input
### Aliases: drRead.csv drRead.csv2 drRead.delim drRead.delim2 drRead.table

### ** Examples

## Not run: 
##D   csvFile <- file.path(tempdir(), "iris.csv")
##D   write.csv(iris, file = csvFile, row.names = FALSE, quote = FALSE)
##D   irisTextConn <- localDiskConn(file.path(tempdir(), "irisText2"), autoYes = TRUE)
##D   a <- drRead.csv(csvFile, output = irisTextConn, rowsPerBlock = 10)
## End(Not run)



