library(orthogonalsplinebasis)


### Name: fitLS
### Title: Fitting splines with penalized least squares.
### Aliases: fitLS
### Keywords: smooth

### ** Examples

knots<-c(0,0,0,0:5,5,5,5)
base<-SplineBasis(knots)
x<-seq(0,5,by=.5)
y<-exp(x)+rnorm(length(x),sd=5)
fitLS(base,x,y)



