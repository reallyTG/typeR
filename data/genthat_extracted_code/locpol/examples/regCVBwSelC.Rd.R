library(locpol)


### Name: regCVBwSelC
### Title: Cross Validation Bandwidth selector.
### Aliases: regCVBwSelC
### Keywords: nonparametric smooth

### ** Examples

	size <- 200
	sigma <- 0.25
	deg <- 1
	kernel <- EpaK
	xeval <- 0:100/100
	regFun <- function(x) x^3
	x <- runif(size)
	y <- regFun(x) + rnorm(x, sd = sigma)
	d <- data.frame(x, y)
	cvBwSel <- regCVBwSelC(d$x,d$y, deg, kernel, interval = c(0, 0.25))
	thBwSel <- thumbBw(d$x, d$y, deg, kernel)
	piBwSel <- pluginBw(d$x, d$y, deg, kernel)
	est <- function(bw, dat, x) return(locPolSmootherC(dat$x,dat$y, x, bw, deg,
					kernel)$beta0)
	ise <- function(val, est) return(sum((val - est)^2 * xeval[[2]]))
	plot(d$x, d$y)
	trueVal <- regFun(xeval)
	lines(xeval, trueVal, col = "red")
	xevalRes <- est(cvBwSel, d, xeval)
	cvIse <- ise(trueVal, xevalRes)
	lines(xeval, xevalRes, col = "blue")
	xevalRes <- est(thBwSel, d, xeval)
	thIse <- ise(trueVal, xevalRes)
	xevalRes <- est(piBwSel, d, xeval)
	piIse <- ise(trueVal, xevalRes)
	lines(xeval, xevalRes, col = "blue", lty = "dashed")
	res <- rbind(	bw = c(cvBwSel, thBwSel, piBwSel), 
					ise = c(cvIse, thIse, piIse) )
	colnames(res) <- c("CV", "th", "PI")
	res



