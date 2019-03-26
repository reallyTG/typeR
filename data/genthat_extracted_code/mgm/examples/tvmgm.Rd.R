library(mgm)


### Name: tvmgm
### Title: Estimating time-varying Mixed Graphical Models
### Aliases: tvmgm tv.mgmfit

### ** Examples


## Not run: 
##D 
##D 
##D ## We specify a time-varying MGM and recover it using tvmgm()
##D 
##D # 1) Specify Model
##D 
##D # a) Define Graph
##D p <- 6
##D type = c("c", "c", "g", "g", "p", "p")
##D level = c(2, 3, 1, 1, 1, 1)
##D n_timepoints <- 1000
##D 
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- matrix(c(1,2,
##D                          2,3,
##D                          3,4), ncol=2, byrow = T)  # no pairwise interactions
##D factors[[2]] <- matrix(c(1,2,3,
##D                          2,3,4), ncol=3, byrow = T) # one 3-way interaction
##D 
##D interactions <- list()
##D interactions[[1]] <- vector("list", length = 3)
##D interactions[[2]] <- vector("list", length = 2)
##D # 3 2-way interactions
##D interactions[[1]][[1]] <- array(0, dim = c(level[1], level[2], n_timepoints))
##D interactions[[1]][[2]] <- array(0, dim = c(level[2], level[3], n_timepoints))
##D interactions[[1]][[3]] <- array(0, dim = c(level[3], level[4], n_timepoints))
##D # 2 3-way interactions
##D interactions[[2]][[1]] <- array(0, dim = c(level[1], level[2], level[3], n_timepoints))
##D interactions[[2]][[2]] <- array(0, dim = c(level[2], level[3], level[4], n_timepoints))
##D theta <- .3
##D interactions[[1]][[1]][1, 1, ] <- theta
##D interactions[[1]][[2]][1, 1, ] <- theta
##D interactions[[1]][[3]][1, 1, ] <- seq(0, theta, length = n_timepoints)
##D interactions[[2]][[1]][1, 1, 1, ] <- theta
##D interactions[[2]][[2]][1, 1, 1, ] <- theta
##D # c) Define Thresholds
##D thresholds <- list()
##D thresholds[[1]] <- matrix(0, nrow = n_timepoints, ncol= level[1])
##D thresholds[[2]] <- matrix(0, nrow = n_timepoints, ncol= level[2])
##D thresholds[[3]] <- matrix(0, nrow = n_timepoints, ncol= level[3])
##D thresholds[[4]] <- matrix(0, nrow = n_timepoints, ncol= level[4])
##D thresholds[[5]] <- matrix(.1, nrow = n_timepoints, ncol= level[5])
##D thresholds[[6]] <- matrix(.1, nrow = n_timepoints, ncol= level[6])
##D # d) define sds
##D sds <- matrix(.2, ncol=p, nrow=n_timepoints)
##D 
##D # 2) Sample Data
##D set.seed(1)
##D d_iter <- tvmgmsampler(factors = factors,
##D                        interactions = interactions,
##D                        thresholds = thresholds,
##D                        sds = sds,
##D                        type = type,
##D                        level = level,
##D                        nIter = 100,
##D                        pbar = TRUE)
##D 
##D data <- d_iter$data
##D head(data)
##D # delete inf rows:
##D ind_finite <- apply(data, 1, function(x) if(all(is.finite(x))) TRUE else FALSE)
##D table(ind_finite) # all fine for this setup & seed
##D # in case of inf values (no theory on how to keep k-order MGM well-defined)
##D data <- data[ind_finite, ] 
##D 
##D 
##D # 3) Recover
##D mgm_c_cv <- tvmgm(data = data,
##D                   type = type,
##D                   level = level,
##D                   k = 3,
##D                   estpoints = seq(0, 1, length=10),
##D                   bandwidth = .1,
##D                   lambdaSel = "CV",
##D                   ruleReg = "AND",
##D                   pbar = TRUE,
##D                   overparameterize = T,
##D                   signInfo = FALSE)
##D 
##D # Look at time-varying pairwise parameter 3-4
##D mgm_c_cv$pairwise$wadj[3,4,] # recovers increase
##D 
##D # 4) Predict values / compute nodewise Errors
##D pred_mgm_cv_w <- predict.mgm(mgm_c_cv,
##D                              data = data,
##D                              tvMethod = "weighted")
##D pred_mgm_cv_cM <- predict.mgm(mgm_c_cv,
##D                               data = data,
##D                               tvMethod = "closestModel")
##D 
##D pred_mgm_cv_w$errors
##D pred_mgm_cv_cM$errors # Pretty similar!
##D 
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
## End(Not run)




