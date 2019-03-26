library(widals)


### Name: MSS.snow
### Title: Metaheuristic Stochastic Search
### Aliases: MSS.snow
### Keywords: ~kwd1 ~kwd2

### ** Examples


##### simulate a state-space system (using pkg SSsimple)

## Not run: 
##D 	
##D tau <- 77 #### number of time points
##D 
##D d.alpha <- 2
##D R.scale <- 1
##D sigma2 <- 0.01
##D F <- 0.999
##D Q <- 0.1
##D 
##D udom <- (0:300)/100
##D plot( udom,    R.scale * exp(-d.alpha*udom) ,  type="l", col="red" ) #### see the covariogram
##D 
##D n.all <- 70 ##### number of spacial locations
##D 
##D set.seed(9999)
##D locs.all <- cbind(runif(n.all, -1, 1), runif(n.all, -1, 1)) #### random location of sensors
##D 
##D D.mx <- distance(locs.all, locs.all, FALSE) #### distance matrix
##D 
##D #### create measurement variance using distance and covariogram
##D R.all <- exp(-d.alpha*D.mx) + diag(sigma2, n.all) 
##D 
##D Hs.all <- matrix(1, n.all, 1) #### constant mean function
##D 
##D ##### use SSsimple to simulate system
##D xsssim <- SS.sim(F=F, H=Hs.all, Q=Q, R=R.all, length.out=tau, beta0=0)
##D 
##D Z.all <- xsssim$Z ###### system observation matrix
##D 
##D 	
##D 	
##D ########### now make assignments required by MSS.snow
##D 	
##D set.seed(9999)
##D 
##D library(SSsimple)
##D 
##D ##### randomly remove five sites to serve as interpolation points
##D ndx.interp <- sample(1:n.all, size=5) 
##D ndx.support <- I(1:n.all)[ -ndx.interp ] ##### support sites
##D 
##D 
##D 
##D ########### what follows are important assignments, 
##D ########### since MSS.snow and the four helper functions
##D ########### will look for these in the Global Environment 
##D ########### to commence fitting the model (as noted in Details above)
##D train.rng <- 30:(tau) ; test.rng <- train.rng
##D 
##D Z <- Z.all[ , ndx.support ] 
##D Hs <- Hs.all[ ndx.support, , drop=FALSE] 
##D locs <- locs.all[ndx.support, , drop=FALSE] 
##D 
##D Ht <- NULL
##D Hst.ls <- NULL
##D 
##D lags <- c(0) 
##D b.lag <- c(-1) 
##D cv <- -2
##D xgeodesic <- FALSE
##D stnd.d <- FALSE
##D ltco <- -10
##D GP <- c(1/10, 1, 20, 20, 1) ### -- initial hyperparameter values
##D run.parallel <- TRUE 
##D 
##D if( cv==2 ) { rm.ndx <- create.rm.ndx.ls( nrow(Hs), 14 ) } else { rm.ndx <- 1:nrow(Hs) }
##D rgr.lower.limit <- 10^(-7) ; d.alpha.lower.limit <- 10^(-3) ; rho.upper.limit <- 10^(4)
##D 
##D 
##D ############## tell snowfall to use two threads for local searches
##D sfInit(TRUE, cpus=2)
##D 
##D 
##D ######## now, finally, search for best fit over support
##D ######## Note that p.ndx.ls and f.d are produced inside fun.load.widals.a()
##D MSS.snow(fun.load.widals.a, NA, p.ndx.ls, f.d, matrix(1/10, 10, length(GP)), 10, 7)
##D sfStop()
##D 
##D ######## we can use these hyperparameters to interpolate to the 
##D ######## deliberately removed sites, and measure MSE, RMSE
##D Z0.hat <- widals.predict(Z, Hs, Ht, Hst.ls, locs, lags, b.lag, 
##D Hs0=Hs.all[ ndx.interp, , drop=FALSE ], 
##D Hst0.ls=NULL, locs0=locs.all[ ndx.interp, , drop=FALSE],
##D geodesic = xgeodesic, wrap.around = NULL, GP, stnd.d = stnd.d, ltco = ltco)
##D 
##D resids.wid <- ( Z.all[ , ndx.interp ] - Z0.hat )
##D mse.wid <- mean( resids.wid[ test.rng, ]^2 )
##D mse.wid
##D sqrt(mse.wid)
##D 
##D 
##D 
##D 
##D 
##D 
##D ########################################### Simulated Imputation with WIDALS
##D Z.all <- xsssim$Z
##D Z.missing <- Z.all
##D 
##D Z.na.all <- matrix( sample(c(TRUE, FALSE), size=n.all*tau, prob=c(0.01, 0.99), replace=TRUE), 
##D tau, n.all)
##D Z.missing[ Z.na.all ] <- NA
##D 
##D 
##D Z <- Z.missing
##D Z[ is.na(Z) ] <- mean(Z, na.rm=TRUE)
##D X <- list("Z.fill"=Z)
##D 
##D Z.na <- Z.na.all
##D Hs <- Hs.all
##D locs <- locs.all
##D Ht <- NULL
##D Hst.ls <- NULL
##D lags <- c(0)
##D b.lag <- c(-1)
##D cv <- -2
##D xgeodesic <- FALSE
##D ltco <- -10
##D if( cv==2 ) { rm.ndx <- create.rm.ndx.ls( nrow(Hs), 14 ) } else { rm.ndx <- 1:nrow(Hs) }
##D 
##D GP <- c(1/10, 1, 20, 20, 1)
##D 
##D rgr.lower.limit <- 10^(-7) ; d.alpha.lower.limit <- 10^(-3) ; rho.upper.limit <- 10^(4)
##D 
##D run.parallel <- TRUE
##D 
##D sfInit(TRUE, cpus=2)
##D 
##D MSS.snow(fun.load.widals.fill, NA, p.ndx.ls, f.d, 
##D seq(2, 0.01, length=10)*matrix(1/10, 10, length(GP)), 10, 7, X=X)
##D sfStop()
##D 
##D sqrt(mean(( (Z.all[train.rng, ] - Z.fill[train.rng, ])^2 )[ Z.na[ train.rng, ] ]))
##D 
##D 
##D 
##D     
##D     
##D     
##D     
##D 
##D ############################################ Now Try with ALS alone
##D 
##D Z.all <- xsssim$Z
##D 
##D GP <- c(1/10, 1) ### -- initial hyperparameter values
##D 
##D ############## tell snowfall to use two threads for local searches
##D sfInit(TRUE, cpus=2)
##D 
##D 
##D ######## now, finally, search for best fit over support
##D ######## Note that p.ndx.ls and f.d are produced inside fun.load.widals.a()
##D MSS.snow(fun.load.hals.a, NA, p.ndx.ls, f.d, matrix(1/10, 10, length(GP)), 10, 7)
##D sfStop()
##D 
##D ######## we can use these hyperparameters to interpolate to the deliberately removed sites, 
##D ######## and measure MSE, RMSE
##D hals.obj <- H.als.b(Z, Hs, Ht, Hst.ls, rho=GP[1], reg=GP[2], b.lag = b.lag, 
##D Hs0 = Hs.all[ ndx.interp, , drop=FALSE ], Ht0 = NULL, Hst0.ls = NULL)
##D Z0.hat <- hals.obj$Z0.hat
##D 
##D resids.als <- ( Z.all[ , ndx.interp ] - Z0.hat )
##D mse.als <- mean( resids.als[ test.rng, ]^2 )
##D mse.als
##D sqrt(mse.als)
##D 
##D 
##D 
##D ########################################### Simulated Imputation with ALS
##D Z.all <- xsssim$Z
##D Z.missing <- Z.all
##D 
##D set.seed(99)
##D Z.na.all <- matrix( sample(c(TRUE, FALSE), size=n.all*tau, prob=c(0.03, 0.97), replace=TRUE), 
##D tau, n.all)
##D Z.missing[ Z.na.all ] <- NA
##D 
##D 
##D Z <- Z.missing
##D Z[ is.na(Z) ] <- 0 #mean(Z, na.rm=TRUE)
##D X <- list("Z.fill"=Z)
##D     
##D Z.na <- Z.na.all
##D 
##D Hs <- Hs.all
##D 
##D GP <- c(1/10, 1) ### -- initial hyperparameter values
##D 
##D sfInit(TRUE, cpus=2)
##D MSS.snow(fun.load.hals.fill, NA, p.ndx.ls, f.d, 
##D seq(3, 0.01, length=10)*matrix(1, 10, length(GP)), 10, 7, X=X)
##D 
##D 
##D sqrt(mean(( (Z.all[train.rng, ] - Z.fill[train.rng, ])^2 )[ Z.na[ train.rng, ] ]))
##D 
## End(Not run)








## The function is currently defined as
function (FUN.source, current.best, p.ndx.ls, f.d, sds.mx, k.glob, k.loc.coef, X = NULL)
{
    envmh <- environment(NULL)
    GP <- GP
    if(is.function(FUN.source)) {
        FUN.source()
    } else {
        if (!is.null(FUN.source)) {
            source(FUN.source)
        }
    }
    if (is.na(current.best)) {
        GP.mx <- matrix(GP, 1, length(GP))
        if (!is.null(FUN.GP)) {
            GP.mx <- FUN.GP(GP.mx)
        }
        current.best <- FUN.MH(1, GP.mx = GP.mx, X = X)
        cat(current.best, "\n")
    }
    if (!is.null(k.glob)) {
        for (k.times in 1:k.glob) {
            cat(k.times, "\n")
            for (p.ndx in p.ndx.ls) {
                n.mh <- as.integer(k.loc.coef * 2^length(p.ndx))
                GP.mx <- matrix(GP, n.mh, length(GP), byrow = TRUE)
                for (ip in p.ndx) {
                    GP.mx[, ip] <- f.d[[ip]](n.mh, GP[ip], sds.mx[k.times,
                    ip])
                }
                if (!is.null(FUN.GP)) {
                    GP.mx <- FUN.GP(GP.mx)
                }
                if (run.parallel) {
                    sfOut <- sfClusterApplyLB(1:n.mh, FUN.MH, GP.mx = GP.mx,
                    X = X)
                }
                else {
                    sfOut <- list()
                    for (jj in 1:n.mh) {
                        sfOut[[jj]] <- FUN.MH(jj, GP.mx = GP.mx,
                        X = X)
                    }
                }
                errs <- unlist(sfOut)
                errs[is.na(errs)] <- Inf
                errs[is.nan(errs)] <- Inf
                best.ndx <- which(errs == min(errs))[1]
                if (errs[best.ndx] < current.best) {
                    current.best <- errs[best.ndx]
                    GP <- GP.mx[best.ndx, , drop = TRUE]
                    assign("current.best", current.best, envir = envmh)
                    assign("current.best.GP", GP, envir = envmh)
                    X <- FUN.I(envmh = envmh, X = X)
                }
            }
        }
    }
    if (!is.null(FUN.EXIT)) {
        FUN.EXIT(envmh = envmh, X = X)
    }
    assign("GP", GP, pos = globalenv())
}



