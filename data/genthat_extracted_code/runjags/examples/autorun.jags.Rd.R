library(runjags)


### Name: autorun.jags
### Title: Run or extend a user-specified Bayesian MCMC model in JAGS with
###   automatically calculated run-length and convergence diagnostics
### Aliases: autoextend.JAGS autoextend.jags autorun.JAGS autorun.jags
### Keywords: models

### ** Examples

# Run a model to calculate the intercept and slope of the expression 
# y = m x + c, assuming normal observation errors for y:

# Simulate the data
N <- 100
X <- 1:N
Y <- rnorm(N, 2*X + 10, 1)

# Model in the JAGS format
model <- "model {
for(i in 1 : N){
	Y[i] ~ dnorm(true.y[i], precision)
	true.y[i] <- m * X[i] + c
}
m ~ dunif(-1000,1000)
c ~ dunif(-1000,1000)
precision ~ dexp(1)

#data# N, X, Y
#inits# m, c, precision
}"

# Initial values to be used:
m <- list(-10, 10)
c <- list(-10, 10)
precision <- list(0.1, 10)
## Not run: 
##D # Run the model using rjags with a 5 minute timeout:
##D results <- autorun.jags(model=model, max.time="5m", 
##D monitor=c("m", "c", "precision"), n.chains=2,
##D method="rjags")
##D 
##D # Analyse standard plots of the results to assess convergence:
##D plot(results)
##D 
##D # Summary of the monitored variables:
##D results
##D 
##D # For more details about possible methods see:
##D vignette('userguide', package='runjags')
## End(Not run)




