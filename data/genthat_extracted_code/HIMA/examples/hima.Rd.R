library(HIMA)


### Name: hima
### Title: High-dimensional Mediation Analysis
### Aliases: hima

### ** Examples

n <- 100  # sample size
p <- 500 # the dimension of covariates

# the regression coefficients alpha (exposure --> mediators)
alpha <- rep(0, p) 

# the regression coefficients beta (mediators --> outcome)
beta1 <- rep(0, p) # for continuous outcome
beta2 <- rep(0, p) # for binary outcome

# the first four markers are true mediators
alpha[1:4] <- c(0.45,0.5,0.6,0.7)
beta1[1:4] <- c(0.55,0.6,0.65,0.7)
beta2[1:4] <- c(1.45,1.5,1.55,1.6)

# these are not true mediators
alpha[7:8] <- 0.5
beta1[5:6] <- 0.8
beta2[5:6] <- 1.7

# Generate simulation data
simdat_cont = simHIMA(n, p, alpha, beta1, seed=1029) 
simdat_bin = simHIMA(n, p, alpha, beta2, binaryOutcome = TRUE, seed=1029) 

# Run HIMA with MCP penalty by default
# When Y is continuous (default)
hima.fit <- hima(simdat_cont$X, simdat_cont$Y, simdat_cont$M, verbose = TRUE) 
head(hima.fit)

# When Y is binary (should specify family)
hima.logistic.fit <- hima(simdat_bin$X, simdat_bin$Y, simdat_bin$M, 
family = "binomial", verbose = TRUE) 
head(hima.logistic.fit)




