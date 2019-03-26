library(DiceDesign)


### Name: wspDesign
### Title: WSP algorithm
### Aliases: wspDesign
### Keywords: design

### ** Examples

dimension <- 2
n <- 100
X <- matrix(runif(n*dimension),n,dimension)
m=wspDesign(X,0.1)
plot(m$design)



