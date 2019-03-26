library(discretecdAlgorithm)


### Name: cd.run
### Title: cd.run
### Aliases: cd.run

### ** Examples


## Not run: 
##D 
##D ### Generate some random data
##D dat <- matrix(rbinom(200, size = 3, prob = 0.4), nrow = 20)
##D # for observational data
##D dat_obs <- sparsebnUtils::sparsebnData(dat, type = "discrete")
##D # for interventional data
##D data_size <- nrow(dat)
##D ivn <- lapply(1:data_size, function(x){return(as.integer(x/10))})
##D # if there is no intervention for an observation, use 0.
##D # cd algorithm can handle multiple interventions for a single observation.
##D dat_int <- sparsebnUtils::sparsebnData(dat, ivn = ivn, type = "discrete")
##D 
##D # Run with default settings for observational data
##D cd.run(indata = dat_obs)
##D # Run with default settings for interventional data
##D cd.run(indata = dat_int)
##D # Run adaptive algorithm for observational data
##D cd.run(indata = dat_obs, adaptive = TRUE)
##D 
##D ### Optional: Adjust settings
##D n_node <- ncol(dat)
##D 
##D # Run algorithm with a given weight
##D # Careful with this option.
##D weights <- matrix(1, nrow = n_node, ncol = n_node)
##D 
##D # Run with adjusted settings
##D cd.run(indata = dat_obs, weights = weights, lambdas.length = 10)
##D 
##D # Note: Normally, users do not need to change default settings.
## End(Not run)



