library(Renext)


### Name: fGEV.MAX
### Title: Fit a GEV distribution from block maxima or r largest order
###   statistics using an aggregated Renewal POT process
### Aliases: fGEV.MAX

### ** Examples

##====================================================================
## block maxima: simulated data and comparison with  the 'fgev'
## function from the 'evd' package
##====================================================================
set.seed(1234)
u <- 10
nBlocks <- 30
nSim <- 100   ## number of samples 
Par <- array(NA, dim = c(nSim, 3, 2),
             dimnames = list(NULL, c("loc", "scale", "shape"), c("MAX", "evd")))
LL <- array(NA, dim = c(nSim, 2),
            dimnames = list(NULL, c("MAX", "evd")))

for (i in 1:nSim) {
  rd <- rRendata(threshold = u,
                 effDuration = 1,
                 lambda = 12,
                 MAX.effDuration = rep(1, nBlocks),
                 MAX.r = rep(1, nBlocks),
                 distname.y = "exp", par.y = c(rate = 1 / 100))

  MAX <- Renext:::makeMAXdata(rd)
  fit.MAX <- fGEV.MAX(MAX = MAX)
  fit.evd <- fgev(x = unlist(MAX$data))
  Par[i, , "MAX"] <- fit.MAX$estimate
  Par[i, , "evd"] <- fit.evd$estimate
  LL[i, "MAX"] <- fit.MAX$loglik
  LL[i, "evd"] <- logLik(fit.evd)
}

##====================================================================
## r largest: use 'ismev::rlarg.fit' on the venice data set.
## NB 'venice' is taken from the 'evd' package here.
##====================================================================
## Not run: 
##D  
##D require(ismev);
##D fit1 <- ismev::rlarg.fit(venice)
##D 
##D ## transform data: each row is a block
##D MAX.data <- as.list(as.data.frame(t(venice)))
##D ## remove the NA imposed by the rectangular matrix format
##D MAX.data <- lapply(MAX.data, function(x) x[!is.na(x)])
##D MAX.effDuration <- rep(1, length(MAX.data))
##D 
##D fit2 <- fGEV.MAX(MAX.data = MAX.data,
##D                  MAX.effDuration = MAX.effDuration)
##D 
##D ## estimates
##D est <- cbind(ismev = fit1$mle, RenextLab = fit2$estimate)
##D print(est)
##D # covariance
##D covs <- array(dim = c(2, 3, 3),
##D               dimnames = list(c("ismev", "RenextLab"),
##D                 colnames(fit2$cov), colnames(fit2$cov)))
##D                 
##D covs["ismev", , ] <- fit1$cov
##D covs["RenextLab", , ] <- fit2$cov
##D print(covs)
## End(Not run)



