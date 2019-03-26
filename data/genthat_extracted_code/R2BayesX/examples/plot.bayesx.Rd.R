library(R2BayesX)


### Name: plot.bayesx
### Title: Default BayesX Plotting
### Aliases: plot.bayesx
### Keywords: hplot

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, -3, 3),
##D    w = runif(n, 0, 6), fac = factor(rep(1:10, n/10)))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + cos(z) * sin(w) +
##D    c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac] + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b1 <- bayesx(y ~ sx(x) + sx(z, w, bs = "te") + fac,
##D    data = dat, method = "MCMC")
##D 
##D ## plot p-spline term
##D plot(b1, term = 1)
##D ## same with
##D plot(b1, term = "sx(x)")
##D 
##D ## with residuals
##D plot(b1, term = "sx(x)", residuals = TRUE)
##D 
##D ## plot tensor term
##D plot(b1, term = "sx(z,w)")
##D 
##D ## use other palette
##D plot(b1, term = "sx(z,w)", col.surface = heat.colors)
##D 
##D ## swap colors
##D plot(b1, term = "sx(z,w)", col.surface = heat.colors, swap = TRUE)
##D 
##D ## plot tensor term with residuals
##D plot(b1, term = "sx(z,w)", residuals = TRUE)
##D 
##D ## plot image and contour
##D plot(b1, term = "sx(z,w)", image = TRUE)
##D plot(b1, term = "sx(z,w)", image = TRUE, contour = TRUE)
##D 
##D ## increase the grid
##D plot(b1, term = "sx(z,w)", image = TRUE, contour = TRUE, grid = 100)
##D 
##D ## plot factor term
##D plot(b1, term = "fac")
##D 
##D ## plot factor term with residuals
##D plot(b1, term = "fac", resid = TRUE, cex = 0.5)
##D 
##D ## plot residual dignostics
##D plot(b1, which = 5:8)
##D 
##D ## plot variance sampling path of term sx(x)
##D plot(b1, term = 1, which = "var-samples")
##D 
##D ## plot coefficients sampling paths of term sx(x)
##D plot(b1, term = 1, which = "coef-samples")
##D 
##D ## plot the sampling path of the intercept
##D par(mfrow = c(1, 1))
##D plot(b1, which = "intcpt-samples")
##D 
##D ## plot the autcorrelation function  
##D ## of the sampled intercept
##D plot(b1, which = "intcpt-samples", 
##D   acf = TRUE, lag.max = 50)
##D 
##D ## increase lags
##D plot(b1, which = "intcpt-samples", 
##D   acf = TRUE, lag.max = 200)
##D 
##D ## plot maximum autocorrelation 
##D ## of all sampled parameters in b1
##D plot(b1, which = "max-acf")
##D 
##D ## plot maximum autocorrelation of 
##D ## all sampled coefficients of term sx(x)
##D plot(b1, term = "sx(x)", which = "coef-samples", 
##D   max.acf = TRUE, lag.max = 100)
##D 
##D 
##D ## now a spatial example
##D set.seed(333)
##D 
##D ## simulate some geographical data
##D data("MunichBnd")
##D N <- length(MunichBnd); names(MunichBnd) <- 1:N
##D n <- N*5
##D 
##D ## regressors
##D dat <- data.frame(id = rep(1:N, n/N), x1 = runif(n, -3, 3))
##D dat$sp <- with(dat, sort(runif(N, -2, 2), decreasing = TRUE)[id])
##D dat$re <- with(dat, rnorm(N, sd = 0.6)[id])
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x1) + sp + re + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b2 <- bayesx(y ~ sx(x1) + sx(id, bs = "mrf", map = MunichBnd) +
##D   sx(id, bs = "re"), method = "MCMC", data = dat)
##D 
##D ## summary statistics
##D summary(b2)
##D 
##D ## plot structured spatial effect
##D plot(b2, term = "sx(id)", map = MunichBnd)
##D 
##D ## plot unstructured spatial effect
##D plot(b2, term = "sx(id):re", map = MunichBnd)
##D 
##D ## now without map
##D ## generates a kernel density plot
##D ## of the effects
##D plot(b2, term = "sx(id):mrf", map = FALSE)
##D plot(b2, term = "sx(id):re", map = FALSE)
##D 
##D ## with approximate quantiles of the  
##D ## kernel density estimate 
##D plot(b2, term = "sx(id):re", map = FALSE, 
##D   kde.quantiles = TRUE, probs = c(0.025, 0.5, 0.975))
##D 
##D ## plot the total spatial effect
##D plot(b2, term = "sx(id):total")
##D plot(b2, term = "sx(id):total", map = MunichBnd)
##D 
##D ## combine model objects
##D b <- c(b1, b2)
##D 
##D ## plot first term of second model
##D plot(b, model = 2, term = 1)
##D plot(b, model = "b2", term = "sx(x1)")
##D 
##D ## plot second term of both models
##D plot(b, term = 2, map = MunichBnd)
##D 
##D ## plot everything
##D plot(b)
## End(Not run)



