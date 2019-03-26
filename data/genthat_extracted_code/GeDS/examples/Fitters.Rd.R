library(GeDS)


### Name: Fitters
### Title: Functions used to fit GeDS objects.
### Aliases: Fitters GenUnivariateFitter UnivariateFitter

### ** Examples

# Examples similar to the ones
# presented in NGeDS and in GGeDS

# Generate a data sample for the response variable
# Y and the covariate X
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N ,min = -2, max = 2))
# Specify a model for the mean of Y to include only
# a component non-linear in X, defined by the function f_1
means <- f_1(X)
# Add (Normal) noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Fit a Normal GeDS regression model using the fitter function
(Gmod <- UnivariateFitter(X, Y, beta = 0.6, phi = 0.995,
           extr = c(-2,2)))

##############################################################
# second: very similar example, but based on Poisson data
set.seed(123)
X <- sort(runif(N , min = -2, max = 2))
means <- exp(f_1(X))
Y <- rpois(N,means)
(Gmod2 <- GenUnivariateFitter(X, Y, beta = 0.2,
            phi = 0.995, family = poisson(), extr = c(-2,2)))

# a plot showing quadratic and cubic fits,
# in the predictor scale
plot(X,log(Y), xlab = "x", ylab = expression(f[1](x)))
lines(Gmod2, n = 3, col = "red")
lines(Gmod2, n = 4, col = "blue", lty = 2)
legend("topleft", c("Quadratic","Cubic"),
     col = c("red","blue"), lty = c(1,2))





