library(spdep)


### Name: aple.plot
### Title: Approximate profile-likelihood estimator (APLE) scatterplot
### Aliases: aple.plot localAple
### Keywords: spatial

### ** Examples

## Not run: 
##D if (require(rgdal, quietly=TRUE)) {
##D example(aple)
##D plt_out <- aple.plot(as.vector(scale(wheat$yield_detrend, scale=FALSE)),
##D  nb2listw(nbr12, style="W"), cex=0.6)
##D crossprod(plt_out$Y, plt_out$X)/crossprod(plt_out$X)
##D lm_obj <- lm(Y ~ X, plt_out)
##D abline(lm_obj)
##D abline(v=0, h=0, lty=2)
##D zz <- summary(influence.measures(lm_obj))
##D infl <- as.integer(rownames(zz))
##D points(plt_out$X[infl], plt_out$Y[infl], pch=3, cex=0.6, col="red")
##D wheat$localAple <- localAple(as.vector(scale(wheat$yield_detrend, scale=FALSE)),
##D  nb2listw(nbr12, style="W"))
##D mean(wheat$localAple)
##D hist(wheat$localAple)
##D spl <- list("sp.text", coordinates(wheat)[infl,], rep("*", length(infl)))
##D spplot(wheat, "localAple", sp.layout=spl)
##D }
## End(Not run)



