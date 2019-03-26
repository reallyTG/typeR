library(dominanceanalysis)


### Name: lmWithCov
### Title: Uses covariance/correlation matrix for calculate OLS
### Aliases: lmWithCov

### ** Examples

cov.m<-matrix(c(1,0.2,0.3, 0.2,1,0.5,0.3,0.5,1),3,3,
dimnames=list(c("x1","x2","y"),c("x1","x2","y")))
lm.cov<-lmWithCov(y~x1+x2,cov.m)
da<-dominanceAnalysis(lm.cov)



