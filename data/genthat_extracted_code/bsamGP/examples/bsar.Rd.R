library(bsamGP)


### Name: bsar
### Title: Bayesian Shape-Restricted Spectral Analysis Regression
### Aliases: bsar
### Keywords: Gaussian processes shape-restricted regression

### ** Examples

## Don't show: 
  # Toy Example
# simulate data
f <- function(x) 5*exp(-10*(x - 1)^4) + 5*x^2

set.seed(1)

n <- 100
x <- runif(n)
y <- f(x) + rnorm(n, sd = 1)

# Number of cosine basis functions
nbasis <- 20

# Fit the model with default priors and mcmc parameters
fout <- bsar(y ~ fs(x), nbasis = nbasis, shape = 'Free')

# Summary
print(fout); summary(fout)

# Trace plots
plot(fout)

# fitted values
fit <- fitted(fout)

# Plot
plot(fit, ask = FALSE)
## End(Don't show)

## Not run: 
##D 
##D ##########################################
##D # Increasing Convex to Concave (S-shape) #
##D ##########################################
##D 
##D # simulate data
##D f <- function(x) 5*exp(-10*(x - 1)^4) + 5*x^2
##D 
##D set.seed(1)
##D 
##D n <- 100
##D x <- runif(n)
##D y <- f(x) + rnorm(n, sd = 1)
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout <- bsar(y ~ fs(x), nbasis = nbasis, shape = 'IncreasingConvex',
##D              spm.adequacy = TRUE)
##D 
##D # Summary
##D print(fout); summary(fout)
##D 
##D # Trace plots
##D plot(fout)
##D 
##D # fitted values
##D fit <- fitted(fout)
##D 
##D # Plot
##D plot(fit, ask = TRUE)
##D 
##D #############################################
##D # Additive Model                            #
##D # Monotone-Increasing and Increasing-Convex #
##D #############################################
##D 
##D # Simulate data
##D f1 <- function(x) 2*pi*x + sin(2*pi*x)
##D f2 <- function(x) exp(6*x - 3)
##D 
##D n <- 200
##D x1 <- runif(n)
##D x2 <- runif(n)
##D x <- cbind(x1, x2)
##D 
##D y <- 5 + f1(x1) + f2(x2) + rnorm(n, sd = 0.5)
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # MCMC parameters
##D mcmc <- list(nblow0 = 1000, nblow = 10000, nskip = 10,
##D              smcmc = 5000, ndisp = 1000, maxmodmet = 10)
##D 
##D # Prior information
##D xmin <- apply(x, 2, min)
##D xmax <- apply(x, 2, max)
##D xrange <- xmax - xmin
##D prior <- list(iflagprior = 0, theta0_m0 = 0, theta0_s0 = 100,
##D               tau2_m0 = 1, tau2_v0 = 100, w0 = 2,
##D               beta_m0 = numeric(1), beta_v0 = diag(100,1),
##D               sigma2_m0 = 1, sigma2_v0 = 1000,
##D               alpha_m0 = 3, alpha_s0 = 50, iflagpsi = 1,
##D               psifixed = 1000, omega_m0 = (xmin + xmax)/2,
##D               omega_s0 = (xrange)/8)
##D 
##D # Fit the model with user specific priors and mcmc parameters
##D fout <- bsar(y ~ fs(x1) + fs(x2), nbasis = nbasis, mcmc = mcmc, prior = prior,
##D              shape = c('Increasing', 'IncreasingS'))
##D 
##D # Summary
##D print(fout); summary(fout)
## End(Not run)



