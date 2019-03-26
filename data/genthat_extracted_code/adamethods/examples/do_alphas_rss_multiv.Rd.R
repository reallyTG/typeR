library(adamethods)


### Name: do_alphas_rss_multiv
### Title: Alphas and RSS of every set of multivariate archetypoids
### Aliases: do_alphas_rss_multiv

### ** Examples

## Not run: 
##D library(fda)
##D ?growth
##D str(growth)
##D hgtm <- growth$hgtm
##D hgtf <- growth$hgtf[,1:39]
##D 
##D # Create array:
##D nvars <- 2
##D data.array <- array(0, dim = c(dim(hgtm), nvars))
##D data.array[,,1] <- as.matrix(hgtm)
##D data.array[,,2] <- as.matrix(hgtf)
##D rownames(data.array) <- 1:nrow(hgtm)
##D colnames(data.array) <- colnames(hgtm)
##D str(data.array)
##D 
##D # Create basis:
##D nbasis <- 10
##D basis_fd <- create.bspline.basis(c(1,nrow(hgtm)), nbasis)
##D PM <- eval.penalty(basis_fd)
##D # Make fd object:
##D temp_points <- 1:nrow(hgtm)
##D temp_fd <- Data2fd(argvals = temp_points, y = data.array, basisobj = basis_fd)
##D 
##D X <- array(0, dim = c(dim(t(temp_fd$coefs[,,1])), nvars))
##D X[,,1] <- t(temp_fd$coef[,,1]) 
##D X[,,2] <- t(temp_fd$coef[,,2])
##D 
##D # Standardize the variables:
##D Xs <- X
##D Xs[,,1] <- scale(X[,,1])
##D Xs[,,2] <- scale(X[,,2])
##D # We have to give names to the dimensions to know the 
##D # observations that were identified as archetypoids.
##D dimnames(Xs) <- list(paste("Obs", 1:dim(hgtm)[2], sep = ""), 
##D                      1:nbasis,
##D                      c("boys", "girls"))
##D 
##D n <- dim(Xs)[1] 
##D # Number of archetypoids:
##D k <- 3 
##D numRep <- 20
##D huge <- 200
##D 
##D # Size of the random sample of observations:
##D m <- 15
##D # Number of samples:
##D N <- floor(1 + (n - m)/(m - k))
##D N
##D prob <- 0.75
##D data_alg <- Xs
##D 
##D nbasis <- dim(data_alg)[2] # number of basis.
##D nvars <- dim(data_alg)[3] # number of variables.
##D n <- nrow(data_alg)
##D 
##D set.seed(1) 
##D rand_obs_si <- sample(1:n, size = m)  
##D si <- apply(data_alg, 2:3, function(x) x[rand_obs_si])  
##D 
##D fada_si <- do_fada_multiv_robust(si, k, numRep, huge, 0.8, FALSE, PM)
##D 
##D k_si <- fada_si$cases
##D alphas_si <- fada_si$alphas
##D colnames(alphas_si) <- rownames(si)
##D 
##D rss_si <- do_alphas_rss_multiv(data_alg, si, huge, k_si, rand_obs_si, alphas_si, 
##D                                "fada_rob", PM, 0.8, nbasis, nvars)
##D str(rss_si)                                
## End(Not run)
                                 



