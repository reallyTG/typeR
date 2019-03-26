library(Lambda4)


### Name: par1f
### Title: One Factor Parallel Covariance Matrix
### Aliases: par1f
### Keywords: datasets

### ** Examples

###---Loadings
fx<-t(matrix(c(
.6,
.6,
.6,
.6,
.6,
.6,
.6,
.6), nrow=1))

###--Error Variances
err<-diag(c(.6^2,.6^2,.6^2,.6^2,
  		.6^2,.6^2,.6^2,.6^2))
		
###---matrix of factor covariances
phi<-matrix(1, nrow=1)

###---Reliability Calculation---###
t1<-matrix(c(rep(1,8)), nrow=1)
t1t<-matrix(c(rep(1,8)), ncol=1)

(fx%*%phi%*%t(fx)+err)



