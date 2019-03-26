library(Lambda4)


### Name: cong3f
### Title: Three-Factor Congeneric Covariance Matrix
### Aliases: cong3f
### Keywords: datasets

### ** Examples

###---Loadings
fx<-t(matrix(c(
.5,0,0,
.6,0,0,
.7,0,0,
.8,0,0,
0,.5,0,
0,.6,0,
0,.7,0,
0,.8,0,
0,0,.5,
0,0,.6,
0,0,.7,
0,0,.8), nrow=3))

###--Error Variances
err<-diag(c(.6^2,.7^2,.8^2,.9^2,
  	.6^2,.7^2,.8^2,.9^2,
		.6^2,.7^2,.8^2,.9^2))
		
###---3x3 matrix of factor covariances
phi<-matrix(c(rep(.3, 9)), nrow=3)
diag(phi)<-1

###---Reliability Calculation---###
t1<-matrix(c(rep(1,12)), nrow=1)
t1t<-matrix(c(rep(1,12)), ncol=1)

(fx%*%phi%*%t(fx)+err)



