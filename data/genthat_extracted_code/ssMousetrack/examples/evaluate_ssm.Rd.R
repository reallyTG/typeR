library(ssMousetrack)


### Name: evaluate_ssm
### Title: Evaluate the adequacy of the state-space model to reproduce the
###   observed data
### Aliases: evaluate_ssm

### ** Examples


## Not run: 
##D ## Fit a state-space model using simulated data 
##D # Generate mouse-tracking data for an univariate experimental design with K = 3 categorical levels, 
##D ## J = 12 trials, I = 5 subjects
##D X1 <- generate_data(I=5,J=12,K=3,Z.formula="~Z1")
##D iid <- 23 # keep just one dataset from the simulated set of datasets
##D # Run the state-space model on the chosen dataset
##D X1_fit <- run_ssm(N = X1$N,I = X1$I,J = X1$J,Y = X1$data$Y[iid,,],D = X1$data$D[iid,,],
##D Z = X1$data$Z,niter=100,nwarmup=25)
##D # Evaluate the state-space model
##D evaluate_ssm(ssmfit = X1_fit,M = 10,plotx=FALSE)
## End(Not run)



