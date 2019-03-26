library(mgm)


### Name: mvarsampler
### Title: Sampling from a mixed VAR model
### Aliases: mvarsampler

### ** Examples


## Not run: 
##D 
##D 
##D ## Generate data from mixed VAR model using mvarsampler() and recover model using mvar()
##D 
##D # 1) Define mVAR model
##D 
##D p <- 6 # Six variables
##D type <- c("c", "c", "c", "c", "g", "g") # 4 categorical, 2 gaussians
##D level <- c(2, 2, 4, 4, 1, 1) # 2 categoricals with m=2, 2 categoricals with m=4, two continuous
##D max_level <- max(level)
##D 
##D lags <- c(1, 3, 9) # include lagged effects of order 1, 3, 9
##D n_lags <- length(lags)
##D 
##D # Specify thresholds
##D thresholds <- list()
##D thresholds[[1]] <- rep(0, level[1])
##D thresholds[[2]] <- rep(0, level[2])
##D thresholds[[3]] <- rep(0, level[3])
##D thresholds[[4]] <- rep(0, level[4])
##D thresholds[[5]] <- rep(0, level[5])
##D thresholds[[6]] <- rep(0, level[6])
##D 
##D # Specify standard deviations for the Gaussians
##D sds <- rep(NULL, p)
##D sds[5:6] <- 1
##D 
##D # Create coefficient array
##D coefarray <- array(0, dim=c(p, p, max_level, max_level, n_lags))
##D 
##D # a.1) interaction between continuous 5<-6, lag=3
##D coefarray[5, 6, 1, 1, 2] <- .4
##D # a.2) interaction between 1<-3, lag=1
##D m1 <- matrix(0, nrow=level[2], ncol=level[4])
##D m1[1,1:2] <- 1
##D m1[2,3:4] <- 1
##D coefarray[1, 3, 1:level[2], 1:level[4], 1] <- m1
##D # a.3) interaction between 1<-5, lag=9
##D coefarray[1, 5, 1:level[1], 1:level[5], 3] <- c(0, 1)
##D 
##D 
##D # 2) Sample
##D set.seed(1)
##D dlist <- mvarsampler(coefarray = coefarray,
##D                      lags = lags,
##D                      thresholds = thresholds,
##D                      sds = sds,
##D                      type = type,
##D                      level = level,
##D                      N = 200,
##D                      pbar = TRUE)
##D 
##D # 3) Recover
##D set.seed(1)
##D mvar_obj <- mvar(data = dlist$data,
##D                  type = type,
##D                  level = level,
##D                  lambdaSel = "CV",
##D                  lags = c(1, 3, 9),
##D                  signInfo = FALSE,
##D                  overparameterize = F)
##D 
##D # Did we recover the true parameters?
##D mvar_obj$wadj[5, 6, 2] # cross-lagged effect of 6 on 5 over lag lags[2]
##D mvar_obj$wadj[1, 3, 1] # cross-lagged effect of 3 on 1 over lag lags[1]
##D mvar_obj$wadj[1, 5, 3] # cross-lagged effect of 1 on 5 over lag lags[3]
##D 
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
## End(Not run)




