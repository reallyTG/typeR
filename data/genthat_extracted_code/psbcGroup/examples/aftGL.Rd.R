library(psbcGroup)


### Name: aftGL
### Title: Function to Fit the Penalized Parametric Bayesian Accelerated
###   Failure Time Model with Group Lasso Prior
### Aliases: aftGL
### Keywords: group lasso prior

### ** Examples


# generate some survival data	
	set.seed(204542)
	
	p = 20
	n = 100
	logHR.true <- c(rep(4, 10), rep(0, (p-10)))	

	CovX<-matrix(0,p,p)

	for(i in 1:10){
		for(j in 1:10){
			CovX[i,j] <- 0.5^abs(i-j)
			}
		}
		
	diag(CovX) <- 1
	
	x	<- apply(rmvnorm(n, sigma=CovX, method="chol"), 2, scale)	
	pred <- as.vector(exp(rowSums(scale(x, center = FALSE, scale = 1/logHR.true))))
	
	t 		<- rexp(n, rate = pred)
	cen		<- runif(n, 0, 8)      
	tcen 		<- pmin(t, cen)
	di 		<- as.numeric(t <= cen)
	
	n <- dim(x)[1]
	p <- dim(x)[2]

	survData <- data.frame(cbind(tcen, di, x))
	colnames(survData)[c(1:2)] <- c("time", "event")

	grpInx <- 1:p
	K <- length(unique(grpInx))
	
	############################
	nu0 <- 3
	sigSq0 <- 1

	alpha0 <- 0
	h0 <- 10^6

	rLam <- 0.5
	deltaLam <- 2

	hyperParams <- c(nu0, sigSq0, alpha0, h0, rLam, deltaLam)

	############################
	alpha <- 0.1
	beta <- rep(0.1, p)
	sigSq <- 1
	tauSq <- rep(0.4, p)
	lambdaSq <- 5
	w	<- log(tcen)

	startValues <- as.vector(c(alpha, beta, sigSq, tauSq, lambdaSq, w))

	############################
	numReps	<- 1000
	thin	<- 1
	burninPerc = 0.5

	fit <- aftGL(survData, grpInx, hyperParams, startValues, numReps, thin, burninPerc)



