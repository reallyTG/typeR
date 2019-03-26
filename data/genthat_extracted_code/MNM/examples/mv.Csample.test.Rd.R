library(MNM)


### Name: mv.Csample.test
### Title: C Sample Test of Location
### Aliases: mv.Csample.test
### Keywords: htest multivariate nonparametric

### ** Examples

X <- rmvt(150,diag(1,3))
g1 <- gl(3,50)
mv.Csample.test(X, g1)
mv.Csample.test(X, g1, score = "s")
mv.Csample.test(X, g1, score = "r")

Y <- rbind(rmvnorm(40,c(0,0,0)), rmvnorm(60,c(0,0,0.4)))
g2 <- factor(rep(1:2, c(40, 60)))
mv.Csample.test(Y, g2, score = "r")
mv.Csample.test(Y, g2, score = "r", method="p")



