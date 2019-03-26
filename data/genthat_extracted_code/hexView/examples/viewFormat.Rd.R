library(hexView)


### Name: viewFormat
### Title: View a Binary File
### Aliases: viewFormat
### Keywords: file connection

### ** Examples

viewFormat(hexViewFile("rawTest.int"),
           memFormat(int1=integer4, int2=integer4))
viewFormat(hexViewFile("rawTest.int"),
           memFormat(integers=vectorBlock(integer4, 20)))



