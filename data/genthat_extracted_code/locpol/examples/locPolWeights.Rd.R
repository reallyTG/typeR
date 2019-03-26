library(locpol)


### Name: locCteWeights
### Title: Local Polynomial Weights
### Aliases: locCteWeightsC locLinWeightsC locWeightsEvalC locWeightsEval
###   locPolWeights
### Keywords: nonparametric smooth

### ** Examples

	size <- 200
	sigma <- 0.25
	deg <- 1
	kernel <- EpaK
	bw <- .25
	xeval <- 0:100/100
	regFun <- function(x) x^3
	x <- runif(size)
	y <- regFun(x) + rnorm(x, sd = sigma)
	d <- data.frame(x, y)
	lcw <- locCteWeightsC(d$x, xeval, bw, kernel)$locWeig
	lce <- locWeightsEval(lcw, y) 
	lceB <- locCteSmootherC(d$x, d$y, xeval, bw, kernel)$beta0
	mean((lce-lceB)^2)
    llw <- locLinWeightsC(d$x, xeval, bw, kernel)$locWeig
	lle <- locWeightsEval(llw, y) 
	lleB <- locLinSmootherC(d$x, d$y, xeval, bw, kernel)$beta0
	mean((lle-lleB)^2)



