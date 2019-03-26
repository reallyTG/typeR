library(Lambda4)


### Name: tau5f
### Title: Five-Factor Tau-Equivalent Covariance Matrix
### Aliases: tau5f
### Keywords: datasets

### ** Examples

###---Loadings
fx<-t(matrix(c(
.6,0,0,0,0,
.6,0,0,0,0,
.6,0,0,0,0,
.6,0,0,0,0,
0,.6,0,0,0,
0,.6,0,0,0,
0,.6,0,0,0,
0,.6,0,0,0,
0,0,.6,0,0,
0,0,.6,0,0,
0,0,.6,0,0,
0,0,.6,0,0,
0,0,0,.6,0,
0,0,0,.6,0,
0,0,0,.6,0,
0,0,0,.6,0,
0,0,0,0,.6,
0,0,0,0,.6,
0,0,0,0,.6,
0,0,0,0,.6), nrow=5))

###--Error Variances
err<-diag(c(.6^2,.7^2,.8^2,.9^2,
  	.6^2,.7^2,.8^2,.9^2,
		.6^2,.7^2,.8^2,.9^2,
		.6^2,.7^2,.8^2,.9^2,
		.6^2,.7^2,.8^2,.9^2))
		
###---5x5 matrix of factor covariances
phi<-matrix(c(rep(.3, 25)), nrow=5)
diag(phi)<-1

###---Reliability Calculation---###
t1<-matrix(c(rep(1,20)), nrow=1)
t1t<-matrix(c(rep(1,20)), ncol=1)

(fx%*%phi%*%t(fx)+err)



