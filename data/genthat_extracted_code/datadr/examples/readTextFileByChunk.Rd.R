library(datadr)


### Name: readTextFileByChunk
### Title: Experimental sequential text reader helper function
### Aliases: readTextFileByChunk

### ** Examples

csvFile <- file.path(tempdir(), "iris.csv")
write.csv(iris, file = csvFile, row.names = FALSE, quote = FALSE)
myoutput <- localDiskConn(file.path(tempdir(), "irisText"), autoYes = TRUE)
a <- readTextFileByChunk(csvFile,
  output = myoutput, linesPerBlock = 10,
  fn = function(x, header) {
    colNames <- strsplit(header, ",")[[1]]
    read.csv(textConnection(paste(x, collapse = "\n")), col.names = colNames, header = FALSE)
  })
a[[1]]



