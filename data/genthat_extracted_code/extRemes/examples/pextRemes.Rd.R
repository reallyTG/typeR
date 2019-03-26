library(extRemes)


### Name: pextRemes
### Title: Probabilities and Random Draws from Fitted EVDs
### Aliases: pextRemes pextRemes.fevd pextRemes.fevd.bayesian
###   pextRemes.fevd.lmoments pextRemes.fevd.mle rextRemes rextRemes.fevd
###   rextRemes.fevd.bayesian rextRemes.fevd.lmoments rextRemes.fevd.mle
### Keywords: distribution models datagen methods

### ** Examples

z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

pextRemes(fit, q=quantile(z, probs=c(0.85, 0.95, 0.99)), lower.tail=FALSE)

z2 <- rextRemes(fit, n=1000)
qqplot(z, z2)

## Not run: 
##D data(PORTw)
##D fit <- fevd(TMX1, PORTw, units="deg C")
##D fit
##D 
##D pextRemes(fit, q=c(17, 20, 25, 30), lower.tail=FALSE)
##D # Note that fit has a bounded upper tail at:
##D # location - scale/shape ~
##D # 15.1406132 + (2.9724952/0.2171486) = 28.82937
##D #
##D # which is why P[X > 30] = 0.  Note also that 25
##D # is less than the upper bound, but larger than
##D # the maximum observed value.
##D 
##D z <- rextRemes(fit, n=50)
##D qqplot(z, PORTw$TMX1, xlab="Simulated Data Quantiles",
##D     ylab="Data Quantiles (PORTw TMX1)")
##D 
##D # Not a great fit because data follow a non-stationary
##D # distribution.
##D fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
##D fit
##D 
##D pextRemes(fit, q=c(17, 20, 25, 30), lower.tail=FALSE)
##D # Gives a warning because we did not give covariate values.
##D 
##D v <- make.qcov(fit, vals=list(mu1=c(1, -1, 1, -1)))
##D v
##D # find probabilities for high positive AOindex vs
##D # low negative AOindex.  A column for the unnecessary
##D # threshold is added, but is not used.
##D 
##D pextRemes(fit, q=c(17, 17, 30, 30), qcov=v, lower.tail=FALSE)
##D 
##D z <- rextRemes(fit, n=50)
##D dim(z)
##D qqplot(z[,1], PORTw$TMX1, xlab="Simulated Data Quantiles",
##D     ylab="Data Quantiles (PORTw TMX1)")
##D 
##D qqplot(z[,28], PORTw$TMX1, xlab="Simulated Data Quantiles",
##D     ylab="Data Quantiles (PORTw TMX1)")
##D # etc.
##D 
##D ##
##D ## GP model with non-constant threshold.
##D ##
##D fit <- fevd(-MinT ~1, Tphap, threshold=c(-70,-7),
##D     threshold.fun=~I((Year - 48)/42), type="GP",
##D     time.units="62/year", verbose=TRUE)
##D fit
##D 
##D summary(fit$threshold)
##D v <- make.qcov(fit, vals=c(rep(1,8), c(-77, -73.5, -71.67, -70)), nr=4)
##D v
##D 
##D # upper bounded df at: u - scale/shape = 
##D c(-77, -73.5, -71.67, -70) + 2.9500992/0.1636367
##D # -58.97165 -55.47165 -53.64165 -51.97165
##D summary(-Tphap$MinT)
##D pextRemes(fit, q=rep(-58, 4), qcov=v, lower.tail=FALSE)
##D 
##D 
## End(Not run)



