library(MNM)


### Name: mv.2way.test
### Title: Randomized Complete Block Design.
### Aliases: mv.2way.test
### Keywords: htest multivariate nonparametric

### ** Examples


blocks <- gl(10, 5)
treatments <- factor(rep(1:5, 10))
X <- rmvnorm(n = 50, mean = c(1,2,3), sigma = diag(3))
mv.2way.test(X, blocks, treatments, score="r", stand="i", method="a")



