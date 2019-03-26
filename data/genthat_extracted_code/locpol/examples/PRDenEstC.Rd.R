library(locpol)


### Name: PRDenEstC
### Title: Parzen-Rosenblatt denstiy estimator.
### Aliases: PRDenEstC
### Keywords: nonparametric smooth

### ** Examples

	N <- 100
	x <-  runif(N)
	xeval <- 0:10/10
	b0.125 <- PRDenEstC(x, xeval, 0.125, EpaK)
	b0.05 <- PRDenEstC(x, xeval, 0.05, EpaK)
	cbind(x = xeval, fx = 1, b0.125 = b0.125$den, b0.05 = b0.05$den)



