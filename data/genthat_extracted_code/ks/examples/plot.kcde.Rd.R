library(ks)


### Name: plot.kcde
### Title: Plot for kernel cumulative distribution estimate
### Aliases: plot.kcde
### Keywords: hplot

### ** Examples

library(MASS)
data(iris)
Fhat <- kcde(x=iris[,1])
plot(Fhat, xlab="Sepal.Length")
Fhat <- kcde(x=iris[,1:2])
plot(Fhat, thin=3)



