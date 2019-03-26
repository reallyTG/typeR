library(Lambda4)


### Name: tau1f
### Title: One-Factor Tau-Equivalent Covariance Matrix
### Aliases: tau1f
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
err<-diag(c(.6^2,.7^2,.8^2,.9^2,
  		.6^2,.7^2,.8^2,.9^2))
		
###---matrix of factor covariances
phi<-matrix(1, nrow=1)

###---Reliability Calculation---###
t1<-matrix(c(rep(1,8)), nrow=1)
t1t<-matrix(c(rep(1,8)), ncol=1)

(fx%*%phi%*%t(fx)+err)



