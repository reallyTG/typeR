library(hexView)


### Name: print.rawBlock
### Title: Print Method for Block of Binary Data
### Aliases: print.rawBlock
### Keywords: print

### ** Examples

fileBlock <- readRaw(hexViewFile("rawTest.txt"))
print(fileBlock)
print(fileBlock, width=8)
print(fileBlock, machine="binary", width=4)



