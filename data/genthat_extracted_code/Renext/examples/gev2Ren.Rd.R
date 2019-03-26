library(Renext)


### Name: gev2Ren
### Title: Translate a vector of GEV parameters into renewal model
### Aliases: gev2Ren

### ** Examples

## GEV parameters and block duration
set.seed(1234)
muGev <- rnorm(1); sigmaGev <- rgamma(1, shape = 5)
xiGev <- runif(1, min = -0.2, max = 0.3)
parGev <- c("loc" = muGev, "scale" = sigmaGev, "shape" = xiGev)
parRen <- gev2Ren(parGev, lambda = 1, jacobian = TRUE, plot = TRUE)
## check by reverse transform
parGevCheck <- Ren2gev(parRen, threshold = attr(parRen, "threshold"))
rbind(parGev, parGevCheck)

##=======================================================================
## slightly positive shape convert to "gpd" and "lomax" distributions
##=======================================================================
x <- rgev(n = 100, loc = 3500, scale = 1000, shape = 0.1)
fit.gev <- fgev(x, start = list("loc" = 3000, "scale" = 1000, "shape" = 0.1))
distNames <- c("gpd", "lomax")
namesRen <- c("lambda", "scale", "shape") # works for the 2 target dists
fitNew <- list()
opar <- par(mfrow = c(3, 1))
for (nm in distNames) {  
  parRen <- gev2Ren(parGev = fit.gev$estimate, threshold = 2800,
                    vcov = fit.gev$var.cov, distname.y = nm)
  namesRen <- c("lambda", "scale", "shape")
  myVcov <- attr(parRen, "vcov")[namesRen, namesRen]
  fitNew[[nm]] <- RenouvNoEst(threshold = attr(parRen, "threshold"),
                              estimate = parRen,
                              distname.y = attr(parRen, "distname.y"),
                              cov = myVcov)
  plot(fitNew[[nm]], Tlim = c(1, 200))
}
plot(fit.gev, which = 4)
par(opar)
##=======================================================================
## slightly negative shape convert to "gpd" and "maxlo" distribution
##=======================================================================
x <- rgev(n = 100, loc = 3500, scale = 1000, shape = -0.2)
fit.gev <- fgev(x, start = list("loc" = 3000, "scale" = 1000, "shape" = 0.1))
distNames <- c("gpd", "maxlo")
namesRen <- c("lambda", "scale", "shape") # works for the 2 target dists
fitNew <- list()
opar <- par(mfrow = c(3, 1))
for (nm in distNames) {
  parRen <- gev2Ren(parGev = fit.gev$estimate, threshold = 2800,
                    vcov = fit.gev$var.cov, distname.y = nm)
  myVcov <- attr(parRen, "vcov")[namesRen, namesRen]
  fitNew[[nm]] <- RenouvNoEst(threshold = attr(parRen, "threshold"),
                              estimate = parRen,
                              distname.y = attr(parRen, "distname.y"),
                              cov = myVcov)
  plot(fitNew[[nm]], Tlim = c(1, 200))
}
plot(fit.gev, which = 4)
par(opar)





