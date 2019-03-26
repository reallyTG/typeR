library(Renext)


### Name: Renouv
### Title: Fit a 'Renouvellement' model
### Aliases: Renouv

### ** Examples

## Garonne data. Use a "Rendata" object as 'x'. Historical data are used!
fit <- Renouv(x = Garonne, distname = "weibull", trace = 1,
              main = "'Garonne' data")
summary(fit)

## generates a warning because of the ties
fit2 <- Renouv(x = Garonne, distname = "gpd",
               jitter.KS = FALSE,
               threshold = 2800, trace = 1,
               main = "'Garonne' data with threshold = 2800 and GPD fit")

## use a numeric vector as 'x'
fit3 <-
    Renouv(x = Garonne$OTdata$Flow,
           threshold = 2500,
           effDuration = 100,
           distname = "gpd",
           OTS.data = list(numeric(0), c(6800, 7200)),
           OTS.effDuration = c(100, 150),
           OTS.threshold = c(7000, 6000), 
           trace = 1,
           main = "'Garonne' data with artificial \"OTS\" data")
## Add historical (fictive) data
fit4 <- Renouv(x = Garonne$OTdata$Flow,
               threshold = 2500,
               effDuration = 100,
               distname = "weibull",
               fixed.par.y = list(shape = 1.1),
               OTS.data = list(numeric(0), c(6800, 7200)),
               OTS.effDuration = c(100, 150),
               OTS.threshold = c(7000, 6000),
               trace = 0,
               main = "'Garonne' data with artificial \"OTS\" data")

##============================================================================
## use the 'venice' dataset in a r-largest fit from the 'evd' package
##============================================================================
## transform data: each row is a block
MAX.data <- as.list(as.data.frame(t(venice)))
## remove the NA imposed by the rectangular matrix format
MAX.data <- lapply(MAX.data, function(x) x[!is.na(x)])
MAX.effDuration <- rep(1, length(MAX.data))

## fit a Renouv model with no OT data. The threshold
## must be in the support of the gev distribution
u <- 66
fit.gpd <- Renouv(x = NULL,
                  MAX.data = MAX.data,
                  MAX.effDuration = MAX.effDuration,
                  distname.y = "gpd",
                  threshold = u,
                  numDeriv = FALSE,
                  trace = 0,
                  plot = FALSE)
## Not run: 
##D   require(ismev)
##D   ## compare with results from the ismev package 
##D   fit.gev <- rlarg.fit(venice)
##D   est.gev <- fit.gev$mle
##D   names(est.gev) <- c("loc", "scale", "shape")
##D   
##D   ## transform the 'gev' fit into a Ren parameter set.
##D   cov.gev <- fit.gev$cov
##D   rownames(cov.gev) <- colnames(cov.gev) <-  c("loc", "scale", "shape")
##D   trans <- gev2Ren(est.gev,
##D                    threshold = u,
##D                    vcovGev = cov.gev)
##D   est <- cbind(ismev = trans, RenextLab = coef(fit.gpd))
##D   colnames(est) <- c("ismev", "RenextLab")
##D   print(est)
##D   
##D   ## fill a 3d array with the two gpd covariance matrices
##D   cov2 <- attr(trans, "vcov")[c(1, 3, 4), c(1, 3, 4)]
##D   
##D   ## covariance
##D   covs <-
##D     array(dim = c(2, 3, 3),
##D           dimnames = list(c("ismev", "RenextLab"),
##D             colnames(fit.gpd$cov), colnames(fit.gpd$cov)))
##D   
##D   covs["ismev", , ] <- cov2
##D   covs["RenextLab", , ] <- fit.gpd$cov
##D   print(covs)
## End(Not run)




