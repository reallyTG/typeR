library(hexView)


### Name: viewRaw
### Title: View the Raw Binary Content of a File
### Aliases: viewRaw
### Keywords: file connection

### ** Examples

viewRaw(hexViewFile("rawTest.txt"), width=8)
viewRaw(hexViewFile("rawTest.txt"), machine="binary", width=4)

# UNICODE text
# rawTest.unicode created using Notepad on Windows
viewRaw(hexViewFile("rawTest.unicode"), width=8)

viewRaw(hexViewFile("rawTest.int"), human="int")
viewRaw(hexViewFile("rawTest.real"), human="real", width=8, endian="big")



