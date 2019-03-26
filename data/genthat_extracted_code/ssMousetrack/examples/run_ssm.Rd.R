library(ssMousetrack)


### Name: run_ssm
### Title: State-space modeling of mouse-tracking trajectories via Stan
### Aliases: run_ssm

### ** Examples


## Not run: 
##D ## Fit a state-space model using simulated data 
##D # Generate mouse-tracking data for an univariate experimental design with K = 3 categorical levels, 
##D # J = 12 trials, I = 5 subjects
##D X1 <- generate_data(I=5,J=12,K=3,Z.formula="~Z1")
##D iid <- 23 # keep just one dataset from the simulated set of datasets
##D # Run the state-space model on the chosen dataset
##D X1_fit <- run_ssm(N = X1$N,I = X1$I,J = X1$J,Y = X1$data$Y[iid,,],D = X1$data$D[iid,,],
##D Z = X1$data$Z)
##D 
##D ## Fit a state-space model using the experimental dataset language
##D # The dataset is ready to be used and it does not need to be pre-processed (preprocess=FALSE). 
##D # In this case, the function prepare_data just computes the observed radians from 
##D # the x-y trajectories
##D X2 <- prepare_data(X = language, preprocess = FALSE, Z.formula = "~condition")
##D # Run the state-space model on the chosen dataset
##D X2_fit <- run_ssm(N = X2$N,I = X2$I,J = X2$J,Y = X2$Y,D = X2$D,Z = X2$Z,
##D niter=5000,nchains=2)
##D 
##D ## Fit a state-space model using the experimental dataset congruency
##D # The dataset needs to be pre-processed (preprocess=TRUE)
##D X3 <- prepare_data(X = congruency, preprocess = TRUE, 
##D Z.formula = "~congruency+plausibility") # additive design
##D # Define priors of the model parameters 
##D KK <- dim(X3$Z)[2] # number of model parameters implied by the design matrix Z
##D priors_list <- list("lognormal(1,0.5)","pareto(3,5.25)","normal(0,2.5)")
##D # note that length(priors_list) = KK 
##D # Run the state-space model on the chosen dataset
##D X3_fit <- run_ssm(N = X3$N,I = X3$I,J = X3$J,Y = X3$Y,D = X3$D,Z = X3$Z,
##D niter=10000,nwarmup=3500,priors=priors_list,nchains=4)
## End(Not run)



