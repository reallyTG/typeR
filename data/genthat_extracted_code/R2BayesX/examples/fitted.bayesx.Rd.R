library(R2BayesX)


### Name: fitted.bayesx
### Title: Extract BayesX Fitted Values and Residuals
### Aliases: fitted.bayesx residuals.bayesx
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(121)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, 0, 1),
##D   w = runif(n, 0, 3))
##D 
##D ## generate response 
##D dat$y <- with(dat, 1.5 + sin(x) + z -3 * w + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b1 <- bayesx(y ~ sx(x) + z + w, data = dat)
##D 
##D ## extract fitted values
##D fit <- fitted(b1)
##D hist(fit, freq = FALSE)
##D 
##D ## now extract 1st model term
##D ## and plot it
##D fx <- fitted(b1, term = "sx(x)")
##D plot(fx)
##D 
##D ## extract model residuals
##D hist(residuals(b1))
##D 
##D ## extract partial residuals for sx(x)
##D pres <- residuals(b1, term = "sx(x)")
##D plot(fx, ylim = range(pres[, 2]))
##D points(pres)
## End(Not run)

## now another example with
## use of read.bayesx.output
## load example data from
## package R2BayesX
dir <- file.path(find.package("R2BayesX"), "examples", "ex01")
b2 <- read.bayesx.output(dir)

## extract fitted values
hist(fitted(b2))

## extract model term of x
## and plot it
fx <- fitted(b2, term = "sx(x)")
plot(fx)


## have a look at the attributes
names(attributes(fx))

## extract the sampling path of the variance
spv <- attr(fx, "variance.sample")
plot(spv, type = "l")


## Not run: 
##D ## combine model objects
##D b <- c(b1, b2)
##D 
##D ## extract fitted terms for second model
##D fit <- fitted(b, model = 2, term = 1:2)
##D names(fit)
##D plot(fit["sx(id)"])
## End(Not run)



