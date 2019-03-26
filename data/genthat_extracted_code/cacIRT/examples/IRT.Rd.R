library(cacIRT)


### Name: Useful IRT Functions
### Title: A collection of useful IRT functions.
### Aliases: 'Useful IRT Functions' iif irf MLE normal.qu SEM sim tif
### Keywords: IRT

### ** Examples

params<-matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)
rdm<-sim(params, rnorm(100))

theta.hat <- MLE(rdm, params)
theta.se  <- SEM(rdm, params)

## transform a cut score of theta = 0 to the expected true score scale

	t.cut <- 0
	x.cut <- sum(irf(params, t.cut)$f)




