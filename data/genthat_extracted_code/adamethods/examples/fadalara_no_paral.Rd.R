library(adamethods)


### Name: fadalara_no_paral
### Title: Functional non-parallel archetypoid algorithm for large
###   applications (FADALARA)
### Aliases: fadalara_no_paral

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
##D seed <- 2018
##D res_fl <- fadalara_no_paral(data = data_alg, seed = seed, N = N, m = m, 
##D                             numArchoid = k, numRep = numRep, huge = huge, 
##D                             prob = prob, type_alg = "fada_rob", compare = FALSE, 
##D                             verbose = TRUE, PM = PM, method = "adjbox", multiv = TRUE,
##D                             frame = FALSE) # frame = TRUE
##D                    
##D str(res_fl)
##D res_fl$cases
##D #[1]  5  8 12
##D res_fl$rss
##D #[1] 3.933064
##D as.vector(res_fl$outliers)
##D #[1] 13 29
## End(Not run)
 



