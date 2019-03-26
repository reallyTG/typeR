library(oompaBase)


### Name: matrixT
### Title: Multiple T Tests by Matrix Multiplication
### Aliases: matrixT matrixUnequalT matrixPairedT matrixVar matrixMean
### Keywords: array htest multivariate

### ** Examples

ng <- 1000
ns <- 50
dat <- matrix(rnorm(ng*ns), ncol=ns)
clas <- factor(rep(c('Good', 'Bad'), each=25))
myMean <- matrixMean(dat)
myVar  <- matrixVar(dat, myMean)
plot(myMean, myVar)


myT <- matrixT(dat, clas)
hist(myT)

rm(ng, ns, dat, myMean, myVar, myT)



