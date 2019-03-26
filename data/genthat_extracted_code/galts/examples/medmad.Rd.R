library(galts)


### Name: medmad
### Title: Function for detecting regression outliers
### Aliases: medmad

### ** Examples

	n <- 100
	x1 <- rnorm(n,0,10)
	x2 <- rnorm(n,0,10)
	x3 <- rnorm(n,0,10)
	x4 <- rnorm(n,0,10)
	e <- rnorm(n)
	x <- cbind(1, x1, x2, x3, x4)
	p <- 5
	betas <- rep(5,p)
	c <- 0.20
	h <- n - n*c
	y <- 5 + 5*x1 + 5*x2 + 5*x3 + 5*x4 + e
	x1[(h + 1):n] <- rnorm(n-h, 100, 10)
	x2[(h + 1):n] <- rnorm(n-h, 100, 10)
	x3[(h + 1):n] <- rnorm(n-h, 100, 10)
	x4[(h + 1):n] <- rnorm(n-h, 100, 10)

	mm <- medmad(formula = y ~ x1 + x2 + x3 + x4, csteps = 10)




