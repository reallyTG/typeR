library(ks)


### Name: plot.histde
### Title: Plot for histogram density estimate
### Aliases: plot.histde
### Keywords: hplot

### ** Examples

library(MASS)
data(iris)

## univariate example
fhat <- histde(x=iris[,2])
plot(fhat, border=3, xlab="Sepal length")

## bivariate example
fhat <- histde(x=iris[,2:3])
plot(fhat, drawpoints=TRUE)
box()



