library(ecolottery)


### Name: coalesc_abc
### Title: Estimation of neutral and non-neutral parameters of community
###   assembly using Approximate Bayesian Computation (ABC)
### Aliases: coalesc_abc do.simul
### Keywords: coalescent Approximate Bayesian Computation niche-based
###   dynamics neutral dynamics

### ** Examples

# Trait-dependent filtering function
filt_gaussian <- function(t, params) exp(-(t-params[1])^2/(2*params[2]^2))

# Definition of parameters and their range
params <- data.frame(rbind(c(0, 1), c(0.05, 1)))
row.names(params) <- c("topt", "sigmaopt")
# Number of values to sample in prior distributions
nb.samp <- 10^6 # Should be large

## Not run: 
##D # Basic summary statistics
##D f.sumstats <- function(com) array(dimnames=list(c("cwm", "cwv", "cws",
##D                                                   "cwk", "S", "Es")),
##D                                   c(mean(com[,3]), var(com[,3]), 
##D                                     e1071::skewness(com[,3]),  
##D                                     e1071::kurtosis(com[,3]),
##D                                     vegan::specnumber(table(com[,2])),
##D                                     vegan::diversity(table(com[,2]))))
##D 
##D # An observed community is here simulated (known parameters)
##D comm <- coalesc(J = 400, m = 0.5, theta = 50,
##D                 filt = function(x) filt_gaussian(x, c(0.2, 0.1)))
##D 
##D # ABC estimation of the parameters based on observed community composition 
##D ## Warning: this function may take a while
##D res <- coalesc_abc(comm$com, comm$pool, f.sumstats = f.sumstats,
##D                    filt.abc = filt_gaussian, params = params, 
##D                    nb.samp = nb.samp, parallel = TRUE, 
##D                    pkg = c("e1071","vegan"), method = "neuralnet")
##D plot(res$abc, param = res$par)
##D hist(res$abc)
##D 
##D # Cross validation
##D ## Warning: this function is slow
##D res$cv <- abc::cv4abc(param = res$par, sumstat = res$ss, nval = 1000,
##D                       tols = c(0.01, 0.1, 1), method = "neuralnet")
##D plot(res$cv)
##D 
##D # Multiple community option
##D # When the input is a site-species matrix, use argument multi="tab"
##D # See vignette Barro_Colorado for more details
##D 
##D # When the input is a list of communities, use argument multi="seqcom"
##D comm.obs <- list()
##D 
##D comm.obs[[1]] <- cbind(rep(1,400), coalesc(J = 400, m = 0.5, filt = function(x)
##D                                            filt_gaussian(x, c(0.2, 0.1)),
##D                                            pool = comm$pool)$com))
##D comm.obs[[2]] <- cbind(rep(2,400), coalesc(J = 400, m = 0.5, filt = function(x) 
##D                                            filt_gaussian(x, c(0.5, 0.1)),
##D                                            pool = comm$pool)$com))
##D comm.obs[[3]] <- cbind(rep(3,400), coalesc(J = 400, m = 0.5, filt = function(x) 
##D                                            filt_gaussian(x, c(0.8, 0.1)),
##D                                            pool = comm$pool)$com))
##D 
##D comm.obs <- lapply(comm.obs, as.matrix)
##D 
##D res <- coalesc_abc(comm.obs, comm$pool, multi="seqcom", f.sumstats=f.sumstats,
##D                    filt.abc = filt_gaussian, params = params, nb.samp = nb.samp,
##D                    parallel = TRUE, pkg = c("e1071","vegan"), tol = 0.1,
##D                    method = "neuralnet")
##D                    
##D lapply(res$abc, summary)
##D 
## End(Not run)



