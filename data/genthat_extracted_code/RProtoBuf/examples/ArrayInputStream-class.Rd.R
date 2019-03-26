library(RProtoBuf)


### Name: ArrayInputStream-class
### Title: Class "ArrayInputStream"
### Aliases: ArrayInputStream-class
### Keywords: classes

### ** Examples

stream <- ArrayInputStream(as.raw(0:10))
stream$ReadRaw(5)

stringsstream <- ArrayInputStream(as.raw(c(0x74, 0x65, 0x73, 0x74, 0x69, 0x6e, 0x67)))
stringsstream$ReadString(7)

intstream <- ArrayInputStream(as.raw(c(0x9e, 0xa7, 0x05)))
intstream$ReadVarint32()



