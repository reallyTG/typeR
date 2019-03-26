library(qut)


### Name: processX
### Title: Process X matrix
### Aliases: processX

### ** Examples

	# Test H0:beta=0
		P=200
		N=20
		s=1
		A=P
		alpha=0.05
		X=matrix(rnorm(N*P),N,P)
		outrescale=processX(X,gaussian,alpha)
		M=100 #Leave the default or select higher value for better level.
	
	#when H0 is not rejected
		beta_scal=0
		beta=c(rep(beta_scal, s), rep(0, P-s)) 
		y=X%*%beta+rnorm(N)
		out=affinelassotest(y,X,gaussian,alpha,M=M,outrescale=outrescale)
		print(out$rejectH0)
	
	#when H0 is rejected
		beta_scal=10
		beta=c(rep(beta_scal, s), rep(0, P-s)) 
		y=X%*%beta+rnorm(N)
		out=affinelassotest(y,X,gaussian,alpha,M=M,outrescale=outrescale)
		print(out$rejectH0)



