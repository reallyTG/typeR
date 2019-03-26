library(qut)


### Name: ztf
### Title: Zero thresholding function
### Aliases: ztf

### ** Examples

	# Test H0:beta=0
		P=200
		N=20
		s=1
		A=P
		X=matrix(rnorm(N*P),N,P)
		M=100 #Leave the default or select higher value for better level.
	#when H0 is not rejected
		beta_scal=0
		beta=c(rep(beta_scal, s), rep(0, P-s)) 
		y=X%*%beta+rnorm(N)
		zerolambda=ztf(y,X,M=M)
		print(zerolambda)
	
	#when H0 is rejected
		beta_scal=10
		beta=c(rep(beta_scal, s), rep(0, P-s)) 
		y=X%*%beta+rnorm(N)
		zerolambda=ztf(y,X,M=M)
		print(zerolambda)



