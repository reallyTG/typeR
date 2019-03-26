library(mgm)


### Name: tvmvar
### Title: Estimating time-varying Mixed Vector Autoregressive Model (mVAR)
### Aliases: tvmvar tv_var.mgm

### ** Examples


## Not run: 
##D 
##D 
##D ## We set up the same model as in the example of mvar(), but
##D ## specify one time-varying parameter, and try to recover it with
##D ## tvmvar()
##D 
##D # a) Specify time-varying VAR model
##D 
##D p <- 6 # Six variables
##D type <- c("c", "c", "c", "c", "g", "g") # 4 categorical, 2 gaussians
##D level <- c(2, 2, 4, 4, 1, 1) # 2 categoricals with 2 categories, 2 with 5
##D max_level <- max(level)
##D n_timepoints <- 4000
##D 
##D lags <- c(1, 3, 9) # include lagged effects of order 1, 3, 9
##D n_lags <- length(lags)
##D 
##D # Specify thresholds
##D thresholds <- list()
##D thresholds[[1]] <- matrix(0, ncol=level[1], nrow=n_timepoints)
##D thresholds[[2]] <- matrix(0, ncol=level[2], nrow=n_timepoints)
##D thresholds[[3]] <- matrix(0, ncol=level[3], nrow=n_timepoints)
##D thresholds[[4]] <- matrix(0, ncol=level[4], nrow=n_timepoints)
##D thresholds[[5]] <- matrix(0, ncol=level[5], nrow=n_timepoints)
##D thresholds[[6]] <- matrix(0, ncol=level[6], nrow=n_timepoints)
##D 
##D # Specify standard deviations for the Gaussians
##D sds <- matrix(NA, ncol=p, nrow=n_timepoints)
##D sds[, 5:6] <- 1
##D 
##D # Create coefficient array
##D coefarray <- array(0, dim=c(p, p, max_level, max_level, n_lags, n_timepoints))
##D 
##D # a.1) interaction between continuous 5<-6, lag=3
##D coefarray[5, 6, 1, 1, 2, ] <- seq(0, .4, length = n_timepoints) # only time-varying parameter
##D # a.2) interaction between 1<-3, lag=1
##D m1 <- matrix(0, nrow=level[2], ncol=level[4])
##D m1[1,1:2] <- 1
##D m1[2,3:4] <- 1
##D coefarray[1, 3, 1:level[2], 1:level[4], 1, ] <- m1 # constant across time
##D # a.3) interaction between 1<-5, lag=9
##D coefarray[1, 5, 1:level[1], 1:level[5], 3, ] <- c(0, 1) # constant across time
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
##D # c.1) Recover: stationary
##D set.seed(1)
##D mvar_obj <- mvar(data = dlist$data,
##D                  type = type,
##D                  level = level,
##D                  lambdaSel = "CV",
##D                  lags = c(1, 3, 9),
##D                  signInfo = FALSE)
##D 
##D # Did we recover the true parameters?
##D mvar_obj$wadj[5, 6, 2] # cross-lagged effect of 6 on 5 over lag lags[2] (lag 3)
##D mvar_obj$wadj[1, 3, 1] # cross-lagged effect of 3 on 1 over lag lags[1] (lag 1)
##D mvar_obj$wadj[1, 5, 3] # cross-lagged effect of 1 on 5 over lag lags[3] (lag 9)
##D 
##D 
##D # c.2) Recover: time-varying
##D set.seed(1)
##D mvar_obj <- tvmvar(data = dlist$data,
##D                    type = type,
##D                    level = level,
##D                    estpoints = seq(0, 1, length=10),
##D                    bandwidth = .15,
##D                    lambdaSel = "CV",
##D                    lags = c(1, 3, 9),
##D                    signInfo = FALSE)
##D 
##D # Did we recover the true parameters?
##D mvar_obj$wadj[5, 6, 2, ] # true sort of recovered
##D mvar_obj$wadj[1, 3, 1, ] # yes
##D mvar_obj$wadj[1, 5, 3, ] # yes
##D 
##D # Plotting parameter estimates over time
##D plot(mvar_obj$wadj[5, 6, 2, ], 
##D      type="l", ylim=c(-.2,.7), 
##D      lwd=2, ylab="Parameter value", xlab="Estimation points")
##D lines(mvar_obj$wadj[1, 3, 1, ], col="red", lwd=2)
##D lines(mvar_obj$wadj[1, 5, 3, ], col="blue", lwd=2)
##D legend("bottomright", c("5 <-- 6", "1 <-- 3", "1 <-- 5"), 
##D        lwd = c(2,2,2), col=c("black", "red", "blue"))
##D 
##D 
##D # d) Predict values / compute nodewise error
##D 
##D mvar_pred_w <- predict.mgm(object=mvar_obj,
##D                            data=dlist$data,
##D                            tvMethod = "weighted")
##D 
##D mvar_pred_cM <- predict.mgm(object=mvar_obj,
##D                             data=dlist$data,
##D                             tvMethod = "closestModel")
##D 
##D mvar_pred_w$errors
##D mvar_pred_cM$errors
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
## End(Not run)




