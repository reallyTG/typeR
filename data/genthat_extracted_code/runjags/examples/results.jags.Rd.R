library(runjags)


### Name: results.jags
### Title: Importing of saved JAGS simulations with partial error recovery
### Aliases: results.JAGS results.jags
### Keywords: models

### ** Examples

## Don't show: 
runjags.options(new.windows=FALSE)
## End(Don't show)
# Run a model using parallel background JAGS calls:

# Simulate the data:
N <- 100
X <- 1:N
Y <- rnorm(N, 2*X + 10, 1)
# Initial values for 2 chains:
m <- list(-10, 10)
c <- list(-10, 10)
precision <- list(0.01, 10)

# Model in the JAGS format
model <- "model { 
for(i in 1 : N){ 
	Y[i] ~ dnorm(true.y[i], precision);
	true.y[i] <- (m * X[i]) + c
} 
m ~ dunif(-1000,1000)
c ~ dunif(-1000,1000) 
precision ~ dexp(1)
#data# X, Y, N
#monitor# m, c, precision
#inits# m, c, precision
}"

## Not run: 
##D # Run the model and produce plots 
##D fileinfo <- run.jags(model=model, n.chains=2, method="bgparallel")
##D # Wait for the simulations to complete:
##D Sys.sleep(10)
##D # Import only variable m from the first chain:
##D results <- results.jags(fileinfo, read.monitor='m', recover.chains=1)
##D # Look at the summary statistics:
##D print(results)
## End(Not run)



