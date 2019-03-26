library(DiceDesign)


### Name: mstCriteria
### Title: Deriving the MST criteria
### Aliases: mstCriteria
### Keywords: design

### ** Examples

dimension <- 2
n <- 40
X <- matrix(runif(n*dimension),n,dimension)
mstCriteria(X,plot2d=TRUE)



