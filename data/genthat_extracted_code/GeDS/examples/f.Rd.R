library(GeDS)


### Name: f
### Title: Defining the covariates for the spline component in a GeDS
###   formula.
### Aliases: f

### ** Examples

# Generate a data sample for the response variable Y and
# the covariates X, reg1, reg2 and off
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N ,min = -2, max = 2))
reg1 <- runif(500, min = -0.1, max = 0.1)
reg2 <- runif(500, min = -0.2, max = 0.2)
off <- runif(500, min = -1, max = 1)
# Specify a model for the mean of Y to include a component non linear
# in X defined by the function f_1 and a linear one in the other covariates
means <- f_1(X) + 2*reg1 + 0.5*reg2 + off
# Add Normal noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Specify a formula that will be used to model Y as a
# function of X, reg1, reg2 and off.
# The covariate X is for the spline component modeled as GeDS,
# reg1 and reg2 enter linearly, off is an offset, i.e. no coefficient
# will be estimated for it
formula <- Y ~ f(X) + reg1 + reg2 + offset(off)

# Fit a GeDS model specified in formula using NGeDS
(Gmod <- NGeDS(formula, beta = 0.6, phi = 0.995, Xextr = c(-2,2)))





