library(dbEmpLikeGOF)


### Name: dbEmpLikeGOF
### Title: Density Based Empirical Likelihood Goodness of Fit
### Aliases: dbEmpLikeGOF
### Keywords: methods

### ** Examples


 x <- rnorm(100)
 testNorm <- dbEmpLikeGOF(x, testcall="normal")
 testUni <- dbEmpLikeGOF(x, testcall="uniform")
 testNorm
 testUni
 y=rnorm(40)
 testDist <- dbEmpLikeGOF(x,y)
 testDist




