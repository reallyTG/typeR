library(fields)


### Name: RCMexample
### Title: 3-hour precipitation fields from a regional climate model
### Aliases: RCMexample
### Keywords: datasets

### ** Examples

data(RCMexample)
# second time period

image.plot( RCMexample$x, RCMexample$y, RCMexample$z[,,2])
world( add=TRUE,  lwd=2, col="grey")




