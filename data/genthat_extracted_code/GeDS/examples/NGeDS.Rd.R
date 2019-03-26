library(GeDS)


### Name: NGeDS
### Title: Geometrically Designed Spline regression estimation
### Aliases: NGeDS

### ** Examples

###################################################
# Generate a data sample for the response variable
# Y and the single covariate X
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

# Apply some of the available methods, e.g.
# coefficients, knots and deviance extractions for the
# quadratic GeDS fit
# Note that the first call to the function knots returns
# also the left and right limits of the interval containing
# the data
coef(Gmod, n = 3)
knots(Gmod, n = 3)
knots(Gmod, n = 3, options = "internal")
deviance(Gmod, n = 3)

# Add a covariate, Z, that enters linearly
Z <- runif(N)
Y2 <- Y + 2*Z + 1
# Re-fit the data using NGeDS
(Gmod2 <- NGeDS(Y2 ~ f(X) + Z, beta = 0.6, phi = 0.995, Xextr = c(-2,2)))
coef(Gmod2, n = 3)
coef(Gmod2, onlySpline = FALSE, n = 3)

## Not run: 
##D ##########################################
##D # Real data example
##D # See Kaishev et al. (2016), section 4.2
##D data('BaFe2As2')
##D (Gmod2 <- NGeDS(intensity ~ f(angle), data = BaFe2As2, beta = 0.6, phi = 0.99, q = 3))
##D plot(Gmod2)
## End(Not run)

#########################################
# bivariate example
# See Dimitrova et al. (2017), section 5

# Generate a data sample for the response variable
# Z and the covariates X and Y assuming Normal noise
set.seed(123)
doublesin <- function(x){
 sin(2*x[,1])*sin(2*x[,2])
}

x <- (round(runif(400, min = 0, max = 3),2))
y <- (round(runif(400, min = 0, max = 3),2))
z <- doublesin(cbind(x,y))
z <- z+rnorm(400, 0, sd = 0.1)
# Fit a two dimensional GeDS model using NGeDS
(BivGeDS <- NGeDS(z ~ f(x, y) , phi = 0.9, beta = 0.3,
Xextr = c(0, 3), Yextr = c(0, 3)))




