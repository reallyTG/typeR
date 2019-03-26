library(WiSEBoot)


### Name: padVector
### Title: Increase data length to the closest power of 2.
### Aliases: padVector
### Keywords: manip arith

### ** Examples

someData <- seq(1,9)+ rnorm(9)

padVector(someData) 
padVector(someData, type="mean", pad.direction="rear") 
padVector(someData, type="periodic", pad.direction="front") 



