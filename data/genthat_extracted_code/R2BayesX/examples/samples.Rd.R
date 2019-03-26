library(R2BayesX)


### Name: samples
### Title: Extract Samples of Coefficients and Variances
### Aliases: samples
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 200
##D 
##D ## regressor
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## response 
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x), data = dat)
##D 
##D ## extract samples for the P-spline
##D sax <- samples(b, term = "sx(x)")
##D colnames(sax)
##D 
##D ## plotting
##D plot(sax)
##D 
##D ## linear effects samples
##D samples(b, term = "linear-samples")
##D 
##D ## for acf, increase lag
##D sax <- samples(b, term = c("linear-samples", "var-samples", "sx(x)"),
##D   acf = TRUE, lag.max = 200, coda = FALSE)
##D names(sax)
##D head(sax)
##D 
##D 
##D ## plot maximum autocorrelation 
##D ## of all parameters
##D sax <- samples(b, term = c("linear-samples", "var-samples", "sx(x)"), 
##D   acf = TRUE, lag.max = 50, coda = FALSE)
##D names(sax)
##D matplot(y = apply(sax, 1, max), type = "h", 
##D   ylab = "ACF", xlab = "lag")
##D 
##D ## example using multiple chains
##D b <- bayesx(y ~ sx(x), data = dat, chains = 3)
##D sax <- samples(b, term = "sx(x)")
##D plot(sax)
## End(Not run)



