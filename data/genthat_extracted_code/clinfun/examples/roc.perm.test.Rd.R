library(clinfun)


### Name: roc.perm.test
### Title: Permutation test to compare ROC curve
### Aliases: roc.perm.test print.roc.perm.test plot.roc.perm.test
### Keywords: htest

### ** Examples

d <- rep(0:1, 50)
x <- rnorm(100) + 1.2*d
y <- rnorm(100) + 1.2*d
oo <- roc.perm.test(x, d, marker2=y)
plot(oo)
oo <- roc.perm.test(c(x,y), c(d,d), group=rep(1:2,each=100))
plot(oo)



