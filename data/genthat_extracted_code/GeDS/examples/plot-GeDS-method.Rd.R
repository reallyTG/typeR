library(GeDS)


### Name: plot,GeDS-method
### Title: Plot method for GeDS objects. Plots GeDS fits.
### Aliases: plot,GeDS-method plot.GeDS

### ** Examples

###################################################
# Generate a data sample for the response variable
# Y and the single covariate X, assuming Normal noise
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N, min = -2, max = 2))
# Specify a model for the mean of Y to include only a component
# non-linear in X, defined by the function f_1
means <- f_1(X)
# Add (Normal) noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Fit a Normal GeDS regression using NGeDS
(Gmod <- NGeDS(Y ~ f(X), beta = 0.6, phi = 0.995, Xextr = c(-2,2)))

# Plot the final quadratic GeDS fit (red solid line)
# with its control polygon (blue dashed line)
plot(Gmod)

# Plot the quadratic fit obtained from the linear fit at the 10th
# iteration of stage A i.e. after 9 internal knots have been inserted
# by the GeDS procedure
plot(Gmod, which=10)

# Generate plots of all the intermediate fits obtained
# by running the GeDS procedure
## Not run: 
##D plot(Gmod, which=1:16)
## End(Not run)

###################################################
# Generate a data sample for the response variable Y and the covariate
# X assuming Poisson distributed error and a log link function

set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N ,min = -2, max = 2))
# Specify a model for the mean of Y to include only a component
# non-linear in X, defined by the function f_1
means <- exp(f_1(X))
# Generate Poisson distributed Y according to the mean model
Y <- rpois(N,means)

# Fit a Poisson GeDS regression model using GGeDS
(Gmod2 <- GGeDS(Y ~ f(X), beta = 0.2, phi = 0.995, family = poisson(),
                Xextr = c(-2,2)))

# similar plots as before, but for the linear fit
plot(Gmod2, n = 2)
plot(Gmod2, which = 10, n = 2)
## Not run: 
##D plot(Gmod2, which = 1:16, n = 2)
##D plot(Gmod2, which = 1:16, n = 2, ask = T)
## End(Not run)




