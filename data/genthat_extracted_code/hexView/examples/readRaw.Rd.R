library(hexView)


### Name: readRaw
### Title: Read the Raw Binary Content of a File
### Aliases: readRaw
### Keywords: file connection

### ** Examples

readLines(hexViewFile("rawTest.txt"))

fileBlock <- readRaw(hexViewFile("rawTest.txt"), width=8)
blockValue(fileBlock)

fileBlock <- readRaw(hexViewFile("rawTest.int"), human="int")
blockValue(fileBlock)



