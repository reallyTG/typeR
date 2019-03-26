library(anfis)


### Name: trainSet
### Title: Bidimentional Sinc train set example
### Aliases: trainSet

### ** Examples

##Domain definition for a regular (x,y) grid with 11 points for each
##coordinates
x <- seq(-10, 10, length= 11)
trainingSet <- trainSet(x,x)
Z <- matrix(trainingSet[,"z"],ncol=length(x),nrow=length(x))

##Plot the domain
persp(x, x, Z, theta=45, phi=15, expand=0.8, col="lightblue",
 ticktype="detailed", main="sinc(x)*sinc(y)")



