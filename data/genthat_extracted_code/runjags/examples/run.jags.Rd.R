library(runjags)


### Name: run.jags
### Title: Run or extend a user-specified Bayesian MCMC model in JAGS from
###   within R
### Aliases: extend.JAGS extend.jags run.JAGS run.jags
### Keywords: models

### ** Examples

## Don't show: 
runjags.options(new.windows=FALSE)
## End(Don't show)
# run a model to calculate the intercept and slope of the expression 
# y = m x + c, assuming normal observation errors for y:

# Simulate the data
X <- 1:100
Y <- rnorm(length(X), 2*X + 10, 1)

# Model in the JAGS format
model <- "model { 
for(i in 1 : N){ 
	Y[i] ~ dnorm(true.y[i], precision);
	true.y[i] <- (m * X[i]) + c
} 
m ~ dunif(-1000,1000)
c ~ dunif(-1000,1000) 
precision ~ dexp(1)
}"

# Data and initial values in a named list format, 
# with explicit control over the random number
# generator used for each chain (optional): 
data <- list(X=X, Y=Y, N=length(X))
inits1 <- list(m=1, c=1, precision=1,
.RNG.name="base::Super-Duper", .RNG.seed=1)
inits2 <- list(m=0.1, c=10, precision=1,
.RNG.name="base::Wichmann-Hill", .RNG.seed=2)

## Not run: 
##D # Run the model and produce plots 
##D results <- run.jags(model=model, monitor=c("m", "c", "precision"), 
##D data=data, n.chains=2, method="rjags", inits=list(inits1,inits2))
##D 
##D # Standard plots of the monitored variables:
##D plot(results)
##D 
##D # Look at the summary statistics:
##D print(results)
##D 
##D # Extract only the coefficient as an mcmc.list object:
##D library('coda')
##D coeff <- as.mcmc.list(results, vars="m")
## End(Not run)


# The same model but using embedded shortcuts to specify data, inits and monitors,
# and using parallel chains:

# Model in the JAGS format

model <- "model {
for(i in 1 : N){ #data# N
	Y[i] ~ dnorm(true.y[i], precision) #data# Y
	true.y[i] <- (m * X[i]) + c #data# X
}
m ~ dunif(-1000,1000) #inits# m
c ~ dunif(-1000,1000)
precision ~ dexp(1)
#monitor# m, c, precision
}"

# Simulate the data
X <- 1:100
Y <- rnorm(length(X), 2*X + 10, 1)
N <- length(X)

initfunction <- function(chain) return(switch(chain, 
	"1"=list(m=-10), "2"=list(m=10)))

## Not run: 
##D # Run the 2 chains in parallel (allowing the run.jags function
##D # to control the number of parallel chains). We also use a
##D # mutate function to convert the precision to standard deviation:
##D results <- run.jags(model, n.chains=2, inits=initfunction,
##D method="parallel", mutate=list("prec2sd", vars="precision"))
##D 
##D # View the results using the standard print method:
##D results
##D 
##D # Look at some plots of the intercept and slope on a 3x3 grid:
##D plot(results, c('trace','histogram','ecdf','crosscorr','key'),
##D vars=c("m","^c"),layout=c(3,3))
##D 
##D # Write the current model representation to file:
##D write.jagsfile(results, file='mymod.txt')
##D # And re-run the simulation from this point:
##D newresults <- run.jags('mymod.txt')
## End(Not run)
# Run the same model using 8 chains in parallel:
# distributed computing cluster:
## Not run: 
##D 
##D # A list of 8 randomly generated starting values for m:
##D initlist <- replicate(8,list(m=runif(1,-20,20)),simplify=FALSE)
##D 
##D # Run the chains in parallel using JAGS (2 models 
##D # with 4 chains each):
##D results <- run.jags(model, n.chains=8, inits=initlist,
##D method="parallel", n.sims=2)
##D 
##D # Set up a distributed computing cluster with 2 nodes:
##D library(parallel)
##D cl <- makeCluster(4)
##D 
##D # Run the chains in parallel rjags models (4 models 
##D # with 2 chains each) on this cluster:
##D results <- run.jags(model, n.chains=8, inits=initlist,
##D method="rjparallel", cl=cl)
##D 
##D stopCluster(cl)
##D 
##D # For more examples see the quick-start vignette:
##D vignette('quickjags', package='runjags')
##D 
##D # And for more details about possible methods see:
##D vignette('userguide', package='runjags')
## End(Not run)



