library(WiSEBoot)


### Name: padMatrix
### Title: Increase data length to the closest power of 2.
### Aliases: padMatrix
### Keywords: manip arith

### ** Examples

someData <- matrix(seq(1,5^2)+rnorm(25), nrow=7) 

padMatrix(someData)
padMatrix(someData, type="mean", pad.direction="rear")
padMatrix(someData, type="periodic", pad.direction="front")



