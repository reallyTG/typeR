library(locpol)


### Name: simpleSmoothers
### Title: Simple smoother
### Aliases: simpleSmootherC simpleSqSmootherC
### Keywords: nonparametric smooth

### ** Examples

	size <- 1000
	x <- runif(100)
	bw <- 0.125
	kernel <- EpaK
	xeval <- 1:9/10
	y <- rep(1,100)	
	##	x kern. aver. should give density f(x)
	prDen <- PRDenEstC(x,xeval,bw,kernel)$den
	ssDen <- simpleSmootherC(x,y,xeval,bw,kernel)$reg
	all(abs(prDen-ssDen)<1e-15)
	##	x kern. aver. should be f(x)*R2(K) aprox.
	s2Den <- simpleSqSmootherC(x,y,xeval,bw,kernel)$reg
	summary( abs(prDen*RK(kernel)-s2Den) )
	summary( abs(1*RK(kernel)-s2Den) )
	##	x kern. aver. should be f(x)*R2(K) aprox.
	for(n in c(1000,1e4,1e5))
	{
		s2D <- simpleSqSmootherC(runif(n),rep(1,n),xeval,bw,kernel)$reg
		cat("\n",n,"\n")
		print( summary( abs(1*RK(kernel)-s2D) ) )
	}



