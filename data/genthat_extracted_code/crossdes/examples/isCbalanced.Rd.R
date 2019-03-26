library(crossdes)


### Name: isCbalanced
### Title: Checking Block Designs for Carryover Balance
### Aliases: isCbalanced
### Keywords: design

### ** Examples

d1 <- matrix( c(1,2,3,4,1,1,1,1), 4,2)
d2 <- matrix( c(1:4,2:4,1,4,1:3,3,4,1,2),ncol=4)
d3 <- matrix( rep(1:3,each=2), ncol=2)
isCbalanced(d1)
isCbalanced(d1,TRUE)  
isCbalanced(d2)
isCbalanced(d3,TRUE)



