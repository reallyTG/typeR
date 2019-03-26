library(bsamGP)


### Name: gbsar
### Title: Bayesian Shape-Restricted Spectral Analysis for Generalized
###   Partial Linear Models
### Aliases: gbsar
### Keywords: Gaussian processes shape-restricted partial linear regression

### ** Examples

## Not run: 
##D ###########################
##D # Probit Regression Model #
##D ###########################
##D 
##D # Simulate data
##D set.seed(1)
##D 
##D f <- function(x) 1.5 * sin(pi * x)
##D 
##D n <- 1000
##D b <- c(1,-1)
##D rho <- 0.7
##D u  <- runif(n, min = -1, max = 1)
##D x  <- runif(n, min = -1, max = 1)
##D w1 <- runif(n, min = -1, max = 1)
##D w2 <- round(f(rho * x + (1 - rho) * u))
##D w  <- cbind(w1, w2)
##D 
##D y  <- w %*% b + f(x) + rnorm(n)
##D y <- (y > 0)
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout <- gbsar(y ~ w1 + w2 + fs(x), family = "bernoulli", link = "probit",
##D               nbasis = nbasis, shape = 'Free')
##D 
##D # Summary
##D print(fout); summary(fout)
##D 
##D # fitted values
##D fit <- fitted(fout)
##D 
##D # Plot
##D plot(fit, ask = TRUE)
##D 
##D ######################################
##D # Logistic Additive Regression Model #
##D ######################################
##D 
##D # Wage-Union data
##D data(wage.union); attach(wage.union)
##D 
##D race[race==1 | race==2]=0
##D race[race==3]=1
##D 
##D y <- union
##D w <- cbind(race,sex,south)
##D x <- cbind(wage,education,age)
##D 
##D # mcmc parameters
##D mcmc <- list(nblow0 = 10000,
##D              nblow = 10000,
##D              nskip = 10,
##D              smcmc = 1000,
##D              ndisp = 1000,
##D              maxmodmet = 10)
##D 
##D foutGBSAR <- gbsar(y ~ race + sex + south + fs(wage) + fs(education) + fs(age),
##D                    family = 'bernoulli', link = 'logit', nbasis = 50, mcmc = mcmc,
##D                    shape = c('Free','Decreasing','Increasing'))
##D 
##D # fitted values
##D fitGBSAR <- fitted(foutGBSAR)
##D 
##D # Plot
##D plot(fitGBSAR, ask = TRUE)
##D 
## End(Not run)
## Don't show: 
  # Toy Example :  Probit Regression Model #
# Simulate data
set.seed(1)

f <- function(x) 1.5 * sin(pi * x)

n <- 100
b <- c(1,-1)
rho <- 0.7
u  <- runif(n, min = -1, max = 1)
x  <- runif(n, min = -1, max = 1)
w1 <- runif(n, min = -1, max = 1)
w2 <- round(f(rho * x + (1 - rho) * u))
w  <- cbind(w1, w2)

y  <- w %*% b + f(x) + rnorm(n)
y <- (y > 0)

# Number of cosine basis functions
nbasis <- 10

# Fit the model with default priors and mcmc parameters
fout <- gbsar(y ~ w1 + w2 + fs(x), family = "bernoulli", link = "probit",
              nbasis = nbasis, shape = 'Free')

# Summary
print(fout); summary(fout)

# fitted values
fit <- fitted(fout)

# Plot
plot(fit, ask = FALSE)
## End(Don't show)



