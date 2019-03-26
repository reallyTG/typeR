library(GeDS)


### Name: GGeDS
### Title: Generalized Geometrically Designed Spline regression estimation
### Aliases: GGeDS

### ** Examples

######################################################################
# Generate a data sample for the response variable Y and the covariate
# X assuming Poisson distributed error and log link function
# See section 4.1 in Dimitrova et al. (2017)
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N, min = -2, max = 2))
# Specify a model for the mean of Y to include only a component
# non-linear in X, defined by the function f_1
means <- exp(f_1(X))
# Generate Poisson distributed Y according to the mean model
Y <- rpois(N, means)

# Fit a Poisson GeDS regression using GGeDS
(Gmod <- GGeDS(Y ~ f(X), beta = 0.2, phi = 0.995, family = poisson(),
                Xextr = c(-2,2)))

# Plot the quadratic and cubic GeDS fits
plot(X,log(Y),xlab = "x", ylab = expression(f[1](x)))
lines(Gmod, n = 3, col = "red")
lines(Gmod, n = 4, col = "blue", lty = 2)
legend("topleft", c("Quadratic", "Cubic"),
       col = c("red", "blue"), lty = c(1,2))

# Generate GeDS prediction at X=0, first on the response scale and then on
# the predictor scale
predict(Gmod, n = 3, newdata = data.frame(X = 0))
predict(Gmod, n = 3, newdata = data.frame(X = 0), type = "link")

# Apply some of the other available methods, e.g.
# knots, coefficients and deviance extractions for the
# quadratic GeDS fit
knots(Gmod)
coef(Gmod)
deviance(Gmod)

# the same but for the cubic GeDS fit
knots(Gmod, n = 4)
coef(Gmod, n = 4)
deviance(Gmod, n = 4)


##########################################
# A real data example
# See Dimitrova et al. (2017), Section 4.2

data("coalMining")
(Gmod2 <- GGeDS(formula = accidents ~ f(years), beta = 0.1, phi = 0.98,
                 family = poisson(), data = coalMining))
(Gmod3 <- GGeDS(formula = accidents ~ f(years), beta = 0.1, phi = 0.985,
                 family = poisson(), data = coalMining))
plot(coalMining$years, coalMining$accidents, type = "h", xlab = "Years",
     ylab = "Accidents")
lines(Gmod2, tr = exp, n = 4, col = "red")
lines(Gmod3, tr = exp, n = 4, col = "blue", lty = 2)
legend("topright", c("phi = 0.98","phi = 0.985"), col = c("red", "blue"),
       lty=c(1, 2))


## Not run: 
##D ##########################################
##D # The same regression in the example of GeDS
##D # but assuming Gamma and Poisson responses
##D # See Dimitrova et al. (2017), Section 4.2
##D 
##D data('BaFe2As2')
##D (Gmod4 <- GGeDS(intensity ~ f(angle), data = BaFe2As2, beta = 0.6, phi = 0.995, q = 3,
##D                 family = Gamma(log), stoptype = "RD"))
##D plot(Gmod4)
##D 
##D (Gmod5 <- GGeDS(intensity ~ f(angle), data = BaFe2As2, beta = 0.1, phi = 0.995, q = 3,
##D                 family = poisson(), stoptype = "SR"))
##D plot(Gmod5)
## End(Not run)

##########################################
# Life tables
# See Dimitrova et al. (2017), Section 4.2

data(EWmortality)
attach(EWmortality)
(M1 <- GGeDS(formula = Deaths ~ f(Age) + offset(log(Exposure)),
              family = poisson(), phi = 0.99, beta = 0.1, q = 3,
              stoptype = "LR"))

Exposure_init <- Exposure + 0.5 * Deaths
Rate <- Deaths / Exposure_init
(M2 <- GGeDS(formula = Rate ~ f(Age), weights = Exposure_init,
              family = quasibinomial(), phi = 0.99, beta = 0.1,
              q = 3, stoptype = "LR"))


op <- par(mfrow=c(2,2))
plot(Age, Deaths/Exposure, ylab = expression(mu[x]), xlab = "Age")
lines(M1, n = 3, tr = exp, lwd = 1, col = "red")
plot(Age, Rate, ylab = expression(q[x]), xlab = "Age")
lines(M2, n = 3, tr = quasibinomial()$linkinv, lwd = 1, col = "red")
plot(Age, log(Deaths/Exposure), ylab = expression(log(mu[x])), xlab = "Age")
lines(M1, n = 3, lwd = 1, col = "red")
plot(Age, quasibinomial()$linkfun(Rate), ylab = expression(logit(q[x])), xlab = "Age")
lines(M2, n = 3, lwd = 1, col = "red")
par(op)




