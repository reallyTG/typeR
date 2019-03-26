library(ICSNP)


### Name: HP.loc.test
### Title: Hallin and Paindaveine Signed-Rank Tests
### Aliases: HP.loc.test
### Keywords: htest multivariate nonparametric

### ** Examples

X <- rmvnorm(100, c(0,0,0.1)) 
HP.loc.test(X)
HP.loc.test(X, score="s")
HP.loc.test(X, score="n")



