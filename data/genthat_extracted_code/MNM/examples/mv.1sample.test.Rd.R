library(MNM)


### Name: mv.1sample.test
### Title: Multivariate Location Tests
### Aliases: mv.1sample.test
### Keywords: htest multivariate nonparametric

### ** Examples

library(mvtnorm)
X <- rmvt(100, diag(c(1, 2, 0.5)), 3)

mv.1sample.test(X,mu=c(0,0,0.5))
mv.1sample.test(X,score="s", stand="i")
mv.1sample.test(X,score="s", stand="i", method="s")
mv.1sample.test(X,score="r", stand="o")
mv.1sample.test(X,score="r", stand="i")



