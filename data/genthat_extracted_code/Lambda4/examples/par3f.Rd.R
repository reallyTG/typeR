library(Lambda4)


### Name: par3f
### Title: Three-Factor Parallel Covariance Matrix
### Aliases: par3f
### Keywords: datasets

### ** Examples

###---Loadings
fx<-t(matrix(c(
.6,0,0,
.6,0,0,
.6,0,0,
.6,0,0,
0,.6,0,
0,.6,0,
0,.6,0,
0,.6,0,
0,0,.6,
0,0,.6,
0,0,.6,
0,0,.6), nrow=3))

###--Error Variances
err<-diag(c(  .6^2,.6^2,.6^2,.6^2,
				.6^2,.6^2,.6^2,.6^2,
				.6^2,.6^2,.6^2,.6^2))
		
###---3x3 matrix of factor covariances
phi<-matrix(c(rep(.3, 9)), nrow=3)
diag(phi)<-1

###---Reliability Calculation---###
t1<-matrix(c(rep(1,12)), nrow=1)
t1t<-matrix(c(rep(1,12)), ncol=1)

(fx%*%phi%*%t(fx)+err)



