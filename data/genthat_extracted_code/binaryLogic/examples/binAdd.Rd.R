library(binaryLogic)


### Name: binAdd
### Title: Binary Addition (+)
### Aliases: binAdd

### ** Examples

five <- as.binary(5); ten <- as.binary(10);
as.numeric(binAdd(ten, five))
binAdd(as.binary(c(0,1), logic=TRUE), as.binary(c(1,0), logic=TRUE))



