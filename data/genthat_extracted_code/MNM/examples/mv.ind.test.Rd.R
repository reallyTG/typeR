library(MNM)


### Name: mv.ind.test
### Title: Independence Test
### Aliases: mv.ind.test
### Keywords: htest multivariate nonparametric

### ** Examples

X <- rmvt(150,diag(1,3),df=3)
Y <- rmvt(150, matrix(c(1,0.5,0.5,1),nrow=2),df=3)

mv.ind.test(X, Y)
mv.ind.test(X, Y, method = "p")

mv.ind.test(X, Y, score = "si")
mv.ind.test(X, Y, score = "si", method = "p")

mv.ind.test(X, Y, score = "r")
mv.ind.test(X, Y, score = "r", method = "p")

mv.ind.test(X, Y, score = "sy")



