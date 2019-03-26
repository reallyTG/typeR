library(mgm)


### Name: mgmsampler
### Title: Sample from k-order Mixed Graphical Model
### Aliases: mgmsampler

### ** Examples


## Not run: 
##D 
##D # --------- Example 1: p = 10 dimensional Gaussian ---------
##D 
##D # ----- 1) Specify Model -----
##D 
##D # a) General Graph Info
##D p <- 10 # number of variables
##D type = rep("g", p) # type of variables
##D level = rep(1, 10) # number of categories for each variable (1 = convention for continuous)
##D 
##D # b) Define interactions
##D factors <- list()
##D factors[[1]] <- matrix(c(1,2,
##D                          1,3,
##D                          4,5,
##D                          7,8), ncol=2, byrow = T) # 4 pairwise interactions
##D interactions <- list()
##D interactions[[1]] <- vector("list", length = 4)
##D 
##D # all pairwise interactions have value .5
##D for(i in 1:4) interactions[[1]][[i]] <- array(.5, dim=c(1, 1))
##D 
##D # c) Define Thresholds
##D thresholds <- vector("list", length = p)
##D thresholds <- lapply(thresholds, function(x) 0 ) # all means are zero
##D 
##D # d) Define Variances
##D sds <- rep(1, p) # All variances equal to 1
##D 
##D 
##D # ----- 2) Sample cases -----
##D 
##D data <- mgmsampler(factors = factors,
##D                    interactions = interactions,
##D                    thresholds = thresholds,
##D                    sds = sds,
##D                    type = type,
##D                    level = level,
##D                    N = 500,
##D                    nIter = 100,
##D                    pbar = TRUE)
##D 
##D 
##D # ----- 3) Recover model from sampled cases -----
##D 
##D set.seed(1)
##D mgm_obj <- mgm(data = data$data,
##D                type = type,
##D                level = level,
##D                k = 2,
##D                lambdaSel = "EBIC",
##D                lambdaGam = 0.25)
##D 
##D mgm_obj$interactions$indicator # worked!
##D 
##D 
##D 
##D # --------- Example 2: p = 3 Binary model with one 3-way interaction ---------
##D 
##D # ----- 1) Specify Model -----
##D 
##D # a) General Graph Info
##D type = c("c", "c", "c")
##D level = c(2, 2, 2)
##D 
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- NULL # no pairwise interactions
##D factors[[2]] <- matrix(c(1,2,3), ncol=3, byrow = T) # one 3-way interaction
##D 
##D interactions <- list()
##D interactions[[1]] <- NULL
##D interactions[[2]] <- vector("list", length = 2)
##D # threeway interaction no1
##D interactions[[2]][[1]] <- array(0, dim = c(level[1], level[2], level[3]))
##D theta <- 2
##D interactions[[2]][[1]][1, 1, 1] <- theta # fill in nonzero entries
##D # thus: high probability for the case that x1 = x2 = x3 = 1
##D 
##D # c) Define Thresholds
##D thresholds <- list()
##D thresholds[[1]] <- rep(0, level[1])
##D thresholds[[2]] <- rep(0, level[2])
##D thresholds[[3]] <- rep(0, level[3])
##D 
##D 
##D # ----- 2) Sample cases -----
##D 
##D set.seed(1)
##D dlist <- mgmsampler(factors = factors,
##D                     interactions = interactions,
##D                     thresholds = thresholds,
##D                     type = type,
##D                     level = level,
##D                     N = 500,
##D                     nIter = 100,
##D                     pbar = TRUE)
##D 
##D 
##D # ----- 3) Check: Contingency Table -----
##D 
##D dat <- dlist$data
##D table(dat[,1], dat[,2], dat[,3]) # this is what we expected
##D 
##D 
##D # ----- 4) Recover model from sampled cases -----
##D 
##D mgm_obj <- mgm(data = dlist$data,
##D                type = type,
##D                level = level,
##D                k = 3,
##D                lambdaSel = "EBIC",
##D                lambdaGam = 0.25, 
##D                overparameterize = TRUE)
##D 
##D mgm_obj$interactions$indicator # recovered, plus small spurious pairwise 1-2
##D 
##D 
##D # --------- Example 3: p = 5 Mixed Graphical Model with two 3-way interaction ---------
##D 
##D # ----- 1) Specify Model -----
##D 
##D # a) General Graph Info
##D type = c("g", "c", "c", "g")
##D level = c(1, 3, 5, 1)
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- NULL # no pairwise interactions
##D factors[[2]] <- matrix(c(1,2,3,
##D                          2,3,4), ncol=3, byrow = T) # no pairwise interactions
##D interactions <- list()
##D interactions[[1]] <- NULL
##D interactions[[2]] <- vector("list", length = 2)
##D # 3-way interaction no1
##D interactions[[2]][[1]] <- array(0, dim = c(level[1], level[2], level[3]))
##D interactions[[2]][[1]][,,1:3] <- rep(.8, 3) # fill in nonzero entries
##D # 3-way interaction no2
##D interactions[[2]][[2]] <- array(0, dim = c(level[2], level[3], level[4]))
##D interactions[[2]][[2]][1,1,] <- .3
##D interactions[[2]][[2]][2,2,] <- .3
##D interactions[[2]][[2]][3,3,] <- .3
##D # c) Define Thresholds
##D thresholds <- list()
##D thresholds[[1]] <- 0
##D thresholds[[2]] <- rep(0, level[2])
##D thresholds[[3]] <- rep(0, level[3])
##D thresholds[[4]] <- 0
##D # d) Define Variances
##D sds <- rep(.1, length(type))
##D 
##D 
##D # ----- 2) Sample cases -----
##D 
##D set.seed(1)
##D data <- mgmsampler(factors = factors,
##D                    interactions = interactions,
##D                    thresholds = thresholds,
##D                    sds = sds,
##D                    type = type,
##D                    level = level,
##D                    N = 500,
##D                    nIter = 100,
##D                    pbar = TRUE)
##D 
##D 
##D # ----- 3) Check: Conditional Means -----
##D 
##D # We condition on the categorical variables and check whether
##D # the conditional means match what we expect from the model:
##D 
##D dat <- data$data
##D 
##D # Check interaction 1
##D mean(dat[dat[,2] == 1 & dat[,3] == 1, 1]) # (compare with interactions[[2]][[1]])
##D mean(dat[dat[,2] == 1 & dat[,3] == 5, 1])
##D # first mean higher, ok!
##D 
##D # Check interaction 2
##D mean(dat[dat[,2] == 1 & dat[,3] == 1, 4]) # (compare with interactions[[2]][[2]])
##D mean(dat[dat[,2] == 1 & dat[,3] == 2, 4])
##D # first mean higher, ok!
##D 
##D 
## End(Not run)




