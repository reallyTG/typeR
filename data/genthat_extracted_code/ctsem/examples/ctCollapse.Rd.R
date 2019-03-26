library(ctsem)


### Name: ctCollapse
### Title: ctCollapse Easily collapse an array margin using a specified
###   function.
### Aliases: ctCollapse

### ** Examples

testarray <- array(rnorm(900,2,1),dim=c(100,3,3))
ctCollapse(testarray,1,mean)



