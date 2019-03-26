library(hexView)


### Name: print.rawFormat
### Title: Print Method for Binary File Format
### Aliases: print.rawFormat
### Keywords: print

### ** Examples

fileFormat <- readFormat(hexViewFile("rawTest.int"),
                         memFormat(int1=integer4, int2=integer4))
print(fileFormat)
print(fileFormat, sep2=":")



