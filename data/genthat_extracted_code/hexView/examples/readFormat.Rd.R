library(hexView)


### Name: readFormat
### Title: Read a Binary File
### Aliases: readFormat
### Keywords: file connection

### ** Examples

fileFormat <- readFormat(hexViewFile("rawTest.int"),
                         memFormat(int1=integer4, int2=integer4))
blockValue(fileFormat$blocks$int2)

fileFormat <- readFormat(hexViewFile("rawTest.int"),
                         memFormat(integers=vectorBlock(integer4, 20)))
blockValue(fileFormat$blocks$integers)



