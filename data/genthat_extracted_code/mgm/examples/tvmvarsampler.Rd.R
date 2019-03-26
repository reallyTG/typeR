library(mgm)


### Name: tvmvarsampler
### Title: Sampling from a time-varying mixed VAR model
### Aliases: tvmvarsampler

### ** Examples



## Not run: 
##D 
##D ## We specify a tvmvar model, sample from it and recover it
##D 
##D # a) Set up time-varying mvar model
##D 
##D p <- 6 # Six variables
##D type <- c("c", "c", "c", "c", "g", "g") # 4 categorical, 2 gaussians
##D level <- c(2, 2, 4, 4, 1, 1) # 2 categoricals with 2 categories, 2 with 5
##D max_level <- max(level)
##D 
##D lags <- c(1, 3, 9) # include lagged effects of order 1, 3, 9
##D n_lags <- length(lags)
##D 
##D N <- 5000
##D 
##D # Specify thresholds
##D thresholds <- list()
##D thresholds[[1]] <- matrix(0, ncol=2, nrow=N)
##D thresholds[[2]] <- matrix(0, ncol=2, nrow=N)
##D thresholds[[3]] <- matrix(0, ncol=4, nrow=N)
##D thresholds[[4]] <- matrix(0, ncol=4, nrow=N)
##D thresholds[[5]] <- matrix(0, ncol=1, nrow=N)
##D thresholds[[6]] <- matrix(0, ncol=1, nrow=N)
##D 
##D # Specify standard deviations for the Gaussians
##D sds <- matrix(NA, ncol=6, nrow=N)
##D sds[,5:6] <- 1
##D 
##D # Create coefficient array
##D coefarray <- array(0, dim=c(p, p, max_level, max_level, n_lags, N))
##D 
##D # a.1) interaction between continuous 5<-6, lag=3
##D coefarray[5, 6, 1, 1, 2, ] <- c(rep(.5, N/2), rep(0, N/2))
##D # a.2) interaction between 1<-3, lag=1
##D m1 <- matrix(0, nrow=level[2], ncol=level[4])
##D m1[1, 1:2] <- 1
##D m1[2, 3:4] <- 1
##D coefarray[1, 3, 1:level[2], 1:level[4], 1, ] <- m1
##D # a.3) interaction between 1<-5, lag=9
##D coefarray[1, 5, 1:level[1], 1:level[5], 3, ] <- c(0, 1)
##D 
##D dim(coefarray)
##D 
##D 
##D # b) Sample
##D set.seed(1)
##D dlist <- tvmvarsampler(coefarray = coefarray,
##D                        lags = lags,
##D                        thresholds = thresholds,
##D                        sds = sds,
##D                        type = type,
##D                        level = level,
##D                        pbar = TRUE)
##D 
##D 
##D # c) Recover: time-varying mVAR model
##D set.seed(1)
##D tvmvar_obj <- tvmvar(data = dlist$data,
##D                      type = type,
##D                      level = level,
##D                      lambdaSel = "CV",
##D                      lags = c(1, 3, 9),
##D                      estpoints = seq(0, 1, length=10),
##D                      bandwidth = .05)
##D 
##D tvmvar_obj$wadj[5, 6, 2, ] # parameter goes down, as specified
##D tvmvar_obj$wadj[1, 3, 1, ]
##D tvmvar_obj$wadj[1, 5, 3, ]
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
## End(Not run)




