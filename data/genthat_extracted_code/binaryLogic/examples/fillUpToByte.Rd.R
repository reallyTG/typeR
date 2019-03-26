library(binaryLogic)


### Name: fillUpToByte
### Title: Fill up to Byte (00000000..)
### Aliases: fillUpToByte

### ** Examples

fillUpToByte(as.binary(c(1,1), logic=TRUE), size=2)
fillUpToByte(as.binary(c(1,0,1), logic=TRUE), size=2, value=FALSE)



