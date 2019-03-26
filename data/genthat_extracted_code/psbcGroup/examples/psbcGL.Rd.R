library(psbcGroup)


### Name: psbcGL
### Title: Function to Fit the Penalized Semiparametric Bayesian Cox Model
###   with Group Lasso Prior
### Aliases: psbcGL
### Keywords: group lasso prior Bayesian lasso prior PSBC model

### ** Examples


## Not run: 
##D 
##D # generate some survival data
##D 	
##D 	set.seed(204542)
##D 	
##D 	p = 20
##D 	n = 100
##D 	beta.true <- c(rep(4, 10), rep(0, (p-10)))	
##D 
##D 	CovX<-matrix(0,p,p)
##D 
##D 	for(i in 1:10){
##D 		for(j in 1:10){
##D 			CovX[i,j] <- 0.5^abs(i-j)
##D 			}
##D 		}
##D 		
##D 	diag(CovX) <- 1
##D 	
##D 	survObj 	<- list()
##D 	survObj$x	<- apply(rmvnorm(n, sigma=CovX, method="chol"), 2, scale)
##D 	
##D 	pred <- as.vector(exp(rowSums(scale(survObj$x, center = FALSE, scale = 1/beta.true))))
##D 	
##D 	t 		<- rexp(n, rate = pred)
##D 	cen		<- runif(n, 0, 8)      
##D 	survObj$t 		<- pmin(t, cen)
##D 	survObj$di 		<- as.numeric(t <= cen)
##D 
##D 	priorPara 			<- list()
##D 	priorPara$eta0 		<- 1
##D 	priorPara$kappa0 	<- 1
##D 	priorPara$c0 		<- 2
##D 	priorPara$r			<- 0.5
##D 	priorPara$delta		<- 0.0001
##D 	priorPara$s			<- sort(survObj$t[survObj$di == 1])
##D 	priorPara$s			<- c(priorPara$s, 2*max(survObj$t)
##D 	-max(survObj$t[-which(survObj$t==max(survObj$t))]))
##D 	priorPara$J			<- length(priorPara$s)
##D 	priorPara$groupInd	<- c(rep(1,10),2:11)
##D 
##D 	mcmcPara				<- list()
##D 	mcmcPara$numBeta		<- p
##D 	mcmcPara$beta.prop.var	<- 1
##D 
##D 	initial				<- list()
##D 	initial$beta.ini	<- rep(0.5, p)
##D 	initial$lambdaSq	<- 1
##D 	initial$sigmaSq		<- runif(1, 0.1, 10)
##D 	initial$tauSq		<- rexp(length(unique(priorPara$groupInd)),
##D 	rate = initial$lambdaSq/2)
##D 	initial$h			<- rgamma(priorPara$J, 1, 1)
##D 
##D 	rw = FALSE
##D 	num.reps = 20000
##D 	chain = 1
##D 	thin = 5
##D 	save = 5
##D 
##D 	fitGL <- psbcGL(survObj, priorPara, initial, rw=FALSE, mcmcPara, 
##D 				num.reps, thin, chain, save)
##D 				
##D 	
## End(Not run)		




