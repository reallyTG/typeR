library(ks)


### Name: plot.kda
### Title: Plot for kernel discriminant analysis
### Aliases: plot.kda
### Keywords: hplot

### ** Examples

library(MASS)
data(iris)

## univariate example
ir <- iris[,1]
ir.gr <- iris[,5]
kda.fhat <- kda(x=ir, x.group=ir.gr, xmin=3, xmax=9)
plot(kda.fhat, xlab="Sepal length")

## bivariate example
ir <- iris[,1:2]
ir.gr <- iris[,5]
kda.fhat <- kda(x=ir, x.group=ir.gr)
plot(kda.fhat)
## No test: 
## trivariate example
ir <- iris[,1:3]
ir.gr <- iris[,5]
kda.fhat <- kda(x=ir, x.group=ir.gr)
plot(kda.fhat, drawpoints=TRUE, col.pt=c(2,3,4))
   ## colour=species, transparency=density heights
## End(No test)



