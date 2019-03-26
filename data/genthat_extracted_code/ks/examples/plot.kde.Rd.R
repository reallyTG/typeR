library(ks)


### Name: plot.kde
### Title: Plot for kernel density estimate
### Aliases: plot.kde
### Keywords: hplot

### ** Examples

library(MASS)
data(iris)

## univariate example
fhat <- kde(x=iris[,2])
plot(fhat, cont=50, col.cont="blue", cont.lwd=2, xlab="Sepal length")

## bivariate example
fhat <- kde(x=iris[,2:3])
plot(fhat, display="filled.contour", cont=seq(10,90,by=10))
plot(fhat, display="persp", thin=3, border=1, col="white")
## No test: 
## trivariate example
fhat <- kde(x=iris[,2:4])
plot(fhat, drawpoints=TRUE)
## End(No test)


