library(ks)


### Name: kda
### Title: Kernel discriminant analysis
### Aliases: Hkda Hkda.diag kda hkda predict.kda compare
###   compare.kda.diag.cv compare.kda.cv
### Keywords: smooth

### ** Examples

set.seed(8192)
x <- c(rnorm.mixt(n=100, mus=1), rnorm.mixt(n=100, mus=-1))
x.gr <- rep(c(1,2), times=c(100,100))
y <- c(rnorm.mixt(n=100, mus=1), rnorm.mixt(n=100, mus=-1))
y.gr <- rep(c(1,2), times=c(100,100))
kda.gr <- kda(x, x.gr)
y.gr.est <- predict(kda.gr, x=y)
compare(y.gr, y.gr.est)

## See other examples in ? plot.kda



