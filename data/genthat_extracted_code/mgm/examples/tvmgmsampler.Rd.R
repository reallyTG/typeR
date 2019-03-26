library(mgm)


### Name: tvmgmsampler
### Title: Sample from time-varying k-order Mixed Graphical Model
### Aliases: tvmgmsampler

### ** Examples



## Not run: 
##D 
##D # --------- Example 1: p = 4 dimensional Gaussian ---------
##D 
##D # ----- 1) Specify Model -----
##D 
##D # a) General Graph Info
##D type = c("g", "g", "g", "g") # Four Gaussians
##D level = c(1, 1, 1, 1)
##D n_timepoints = 500 #  Number of time points
##D 
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- array(NA, dim=c(2, 2)) # two pairwise interactions
##D factors[[1]][1, 1:2] <- c(3,4)
##D factors[[1]][2, 1:2] <- c(1,2)
##D 
##D # Two parameters, one linearly increasing from 0 to 0.8, another one lin decreasing from 0.8 to 0
##D interactions <- list()
##D interactions[[1]] <- vector("list", length = 2)
##D interactions[[1]][[1]] <- array(0, dim = c(level[1], level[2], n_timepoints))
##D interactions[[1]][[1]][1,1, ] <- seq(.8, 0, length = n_timepoints)
##D interactions[[1]][[2]] <- array(0, dim = c(level[1], level[2], n_timepoints))
##D interactions[[1]][[2]][1,1, ] <- seq(0, .8, length = n_timepoints)
##D 
##D # c) Define Thresholds
##D thresholds <- vector("list", length = 4)
##D thresholds <- lapply(thresholds, function(x) matrix(0, ncol = level[1], nrow = n_timepoints))
##D 
##D # d) Define Standard deviations
##D sds <- matrix(1, ncol = length(type), nrow = n_timepoints) # constant across variables and time
##D 
##D 
##D # ----- 2) Sample cases -----
##D 
##D set.seed(1)
##D dlist <- tvmgmsampler(factors = factors,
##D                       interactions = interactions,
##D                       thresholds = thresholds,
##D                       sds = sds,
##D                       type = type,
##D                       level = level,
##D                       nIter = 75,
##D                       pbar = TRUE)
##D 
##D 
##D # ----- 3) Recover model from sampled cases -----
##D 
##D set.seed(1)
##D tvmgm_obj <- tvmgm(data = dlist$data,
##D                    type = type,
##D                    level = level,
##D                    estpoints = seq(0, 1, length = 15),
##D                    bandwidth = .2,
##D                    k = 2,
##D                    lambdaSel = "CV",
##D                    ruleReg = "AND")
##D 
##D # How well did we recover those two time-varying parameters?
##D plot(tvmgm_obj$pairwise$wadj[3,4,], type="l", ylim=c(0,.8))
##D lines(tvmgm_obj$pairwise$wadj[1,2,], type="l", col="red")
##D # Looks quite good
##D 
##D 
##D # --------- Example 2: p = 5 binary; one 3-way interaction ---------
##D 
##D # ----- 1) Specify Model -----
##D 
##D # a) General Graph Info
##D p <- 5 # number of variables
##D type = rep("c", p) # all categorical
##D level = rep(2, p) # all binary
##D n_timepoints <- 1000
##D 
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- NULL # no pairwise interactions
##D factors[[2]] <- array(NA, dim = c(1,3)) # one 3-way interaction
##D factors[[2]][1, 1:3] <- c(1, 2, 3)
##D 
##D interactions <- list()
##D interactions[[1]] <- NULL # no pairwise interactions
##D interactions[[2]] <- vector("list", length = 1)  # one 3-way interaction
##D # 3-way interaction no1
##D interactions[[2]][[1]] <- array(0, dim = c(level[1], level[2], level[3], n_timepoints))
##D theta <- 2
##D interactions[[2]][[1]][1, 1, 1, ] <- seq(0, 2, length = n_timepoints) # fill in nonzero entries
##D 
##D # c) Define Thresholds
##D thresholds <- list()
##D for(i in 1:p) thresholds[[i]] <- matrix(0, nrow = n_timepoints, ncol = level[i])
##D 
##D 
##D # ----- 2) Sample cases -----
##D 
##D set.seed(1)
##D dlist <- tvmgmsampler(factors = factors,
##D                       interactions = interactions,
##D                       thresholds = thresholds,
##D                       type = type,
##D                       level = level,
##D                       nIter = 150,
##D                       pbar = TRUE)
##D 
##D 
##D # ----- 3) Check Marginals -----
##D 
##D dat <- dlist$data[1:round(n_timepoints/2),]
##D table(dat[,1], dat[,2], dat[,3])
##D 
##D dat <- dlist$data[round(n_timepoints/2):n_timepoints,]
##D table(dat[,1], dat[,2], dat[,3])
##D 
##D # Observation: much stronger effect in second hald of the time-series,
##D # which is what we expect
##D 
##D 
##D # ----- 4) Recover model from sampled cases -----
##D 
##D set.seed(1)
##D tvmgm_obj <- tvmgm(data = dlist$data,
##D                    type = type,
##D                    level = level,
##D                    estpoints = seq(0, 1, length = 15),
##D                    bandwidth = .2,
##D                    k = 3,
##D                    lambdaSel = "CV",
##D                    ruleReg = "AND")
##D 
##D tvmgm_obj$interactions$indicator
##D # Seems very difficult to recover this time-varying 3-way binary interaction
##D # See also the corresponding problems in the examples of ?mgmsampler
##D 
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
## End(Not run)





