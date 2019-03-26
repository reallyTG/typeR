library(R2BayesX)


### Name: plotsamples
### Title: Plot Sampling Path(s) of Coefficient(s) and Variance(s)
### Aliases: plotsamples
### Keywords: hplot

### ** Examples

## generate some data
set.seed(111)
n <- 500

## regressors
dat <- data.frame(x = runif(n, -3, 3))

## response
dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ sx(x), data = dat)
##D summary(b)
##D 
##D ## plot sampling path for
##D ## the variance
##D plot(b, term = "sx(x)", which = "var-samples")
##D 
##D ## plot sampling paths for 
##D ## coefficients
##D plot(b, term = "sx(x)", which = "coef-samples")
##D 
##D ## plot maximum autocorrelation of
##D ## all sampled parameters of term s(x)
##D plot(b, term = "sx(x)", which = "coef-samples", max.acf = TRUE)
##D 
##D ## extract samples of term sx(x)
##D sax <- as.matrix(samples(b, term = "sx(x)"))
##D 
##D ## now use plotsamples
##D plotsamples(sax, selected = "sx(x)")
##D 
##D ## some variations
##D plotsamples(sax, selected = "sx(x)", acf = TRUE)
##D plotsamples(sax, selected = "sx(x)", acf = TRUE, lag.max = 200)
## End(Not run)



