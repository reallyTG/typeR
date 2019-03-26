library(cgam)


### Name: predict.cgam
### Title: Predict Method for CGAM Fits
### Aliases: predict.cgam
### Keywords: prediction routine

### ** Examples

# Example 1.
	# generate data
	n <- 100
	set.seed(123)
	x <- runif(n)
	y <- 4*x^3 + rnorm(n)

	# regress y on x under the shape-restriction: "increasing-convex"
	fit <- cgam(y ~ s.incr.conv(x))
	
	# make a data frame 
	x0 <- seq(min(x), max(x), by = 0.05)
	new.Data <- data.frame(x = x0)

	# predict values in new.Data based on the cgam fit without a confidence interval
	pfit <- predict(fit, new.Data)
	
	# or 
	pfit <- predict(fit, new.Data, interval = "none")
	
	# make a plot to check the prediction
	plot(x, y, main = "Predict Method for CGAM")
	lines(sort(x), (fitted(fit)[order(x)]))
	points(x0, pfit$fit, col = 2, pch = 20)

	# predict values in new.Data based on the cgam fit with a 95 percent confidence interval
	pfit <- predict(fit, new.Data, interval = "confidence", level = 0.95)

	# make a plot to check the prediction
	plot(x, y, main = "Pointwise Confidence Bands (Gaussian Response)")
	lines(sort(x), (fitted(fit)[order(x)]))
	lines(sort(x0), (pfit$lower)[order(x0)], col = 2, lty = 2)
	lines(sort(x0), (pfit$upper)[order(x0)], col = 2, lty = 2)
	points(x0, pfit$fit, col = 2, pch = 20)

# Example 2. binomial response
	n <- 200
	x <- seq(0, 1, length = n)

	eta <- 4*x - 2
	mu <- exp(eta)/(1+exp(eta))
	set.seed(123)
	y <- 1:n*0
	y[runif(n)<mu] = 1
        
	fit <- cgam(y ~ s.incr.conv(x), family = binomial)
	muhat <- fitted(fit)
	
    # predict values in new.Data based on the cgam fit with a 95 percent confidence interval
    xinterp <- seq(min(x), max(x), by = 0.05)
    new.Data <- data.frame(x = xinterp)
	pfit <- predict(fit, new.Data, interval = "confidence", level = 0.95)
	pmu <- pfit$fit
	lwr <- pfit$lower
	upp <- pfit$upper
	
	# make a plot to check the prediction	
	plot(x, y, type = "n", ylim = c(0, 1), 
	main = "Pointwise Confidence Bands (Binomial Response)")
	rug(x[y == 0])
    rug(x[y == 1], side = 3)   
	lines(x, mu)
	lines(x, muhat, col = 5, lty = 2)
       
	points(xinterp, pmu, pch = 20)
	lines(xinterp, upp, col = 5)
	points(xinterp, upp, pch = 20)
	lines(xinterp, lwr, col = 5)
	points(xinterp, lwr, pch = 20)



