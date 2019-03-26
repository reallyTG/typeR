library(spBayes)


### Name: bayesGeostatExact
### Title: Simple Bayesian spatial linear model with fixed semivariogram
###   parameters
### Aliases: bayesGeostatExact
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D data(FBC07.dat)
##D Y <- FBC07.dat[1:150,"Y.2"]
##D coords <- as.matrix(FBC07.dat[1:150,c("coord.X", "coord.Y")])
##D 
##D n.samples <- 500
##D n = length(Y)
##D p = 1
##D 
##D phi <- 0.15
##D nu <- 0.5
##D 
##D beta.prior.mean <- as.matrix(rep(0, times=p))
##D beta.prior.precision <- matrix(0, nrow=p, ncol=p)
##D 
##D alpha <- 5/5
##D 
##D sigma.sq.prior.shape <- 2.0
##D sigma.sq.prior.rate <- 5.0
##D 
##D ##############################
##D ##Simple linear model with
##D ##the default exponential
##D ##spatial decay function
##D ##############################
##D set.seed(1)
##D m.1 <- bayesGeostatExact(Y~1, n.samples=n.samples,
##D                           beta.prior.mean=beta.prior.mean,
##D                           beta.prior.precision=beta.prior.precision,
##D                           coords=coords, phi=phi, alpha=alpha,
##D                           sigma.sq.prior.shape=sigma.sq.prior.shape,
##D                           sigma.sq.prior.rate=sigma.sq.prior.rate)
##D 
##D 
##D 
##D print(summary(m.1$p.samples))
##D 
##D ##Requires MBA package to
##D ##make surfaces
##D library(MBA)
##D par(mfrow=c(1,2))
##D obs.surf <-
##D   mba.surf(cbind(coords, Y), no.X=100, no.Y=100, extend=T)$xyz.est
##D image(obs.surf, xaxs = "r", yaxs = "r", main="Observed response")
##D points(coords)
##D contour(obs.surf, add=T)
##D 
##D w.hat <- rowMeans(m.1$sp.effects)
##D w.surf <-
##D   mba.surf(cbind(coords, w.hat), no.X=100, no.Y=100, extend=T)$xyz.est
##D image(w.surf, xaxs = "r", yaxs = "r", main="Estimated random effects")
##D points(coords)
##D contour(w.surf, add=T)
##D 
##D 
##D ##############################
##D ##Simple linear model with
##D ##the matern spatial decay
##D ##function. Note, nu=0.5 so
##D ##should produce the same
##D ##estimates as m.1
##D ##############################
##D set.seed(1)
##D m.2 <- bayesGeostatExact(Y~1, n.samples=n.samples,
##D                           beta.prior.mean=beta.prior.mean,
##D                           beta.prior.precision=beta.prior.precision,
##D                           coords=coords, cov.model="matern",
##D                           phi=phi, nu=nu, alpha=alpha,
##D                           sigma.sq.prior.shape=sigma.sq.prior.shape,
##D                           sigma.sq.prior.rate=sigma.sq.prior.rate)
##D 
##D print(summary(m.2$p.samples))
##D 
##D ##############################
##D ##This time with the
##D ##spherical just for fun
##D ##############################
##D m.3 <- bayesGeostatExact(Y~1, n.samples=n.samples,
##D                           beta.prior.mean=beta.prior.mean,
##D                           beta.prior.precision=beta.prior.precision,
##D                           coords=coords, cov.model="spherical",
##D                           phi=phi, alpha=alpha,
##D                           sigma.sq.prior.shape=sigma.sq.prior.shape,
##D                           sigma.sq.prior.rate=sigma.sq.prior.rate)
##D 
##D print(summary(m.3$p.samples))
##D 
##D ##############################
##D ##Another example but this
##D ##time with covariates
##D ##############################
##D data(FORMGMT.dat)
##D 
##D n = nrow(FORMGMT.dat)
##D p = 5 ##an intercept an four covariates
##D 
##D n.samples <- 50
##D 
##D phi <- 0.0012
##D 
##D coords <- cbind(FORMGMT.dat$Longi, FORMGMT.dat$Lat)
##D coords <- coords*(pi/180)*6378
##D 
##D beta.prior.mean <- rep(0, times=p)
##D beta.prior.precision <- matrix(0, nrow=p, ncol=p)
##D 
##D alpha <- 1/1.5
##D 
##D sigma.sq.prior.shape <- 2.0
##D sigma.sq.prior.rate <- 10.0
##D 
##D m.4 <-
##D   bayesGeostatExact(Y~X1+X2+X3+X4, data=FORMGMT.dat, n.samples=n.samples,
##D                      beta.prior.mean=beta.prior.mean,
##D                      beta.prior.precision=beta.prior.precision,
##D                      coords=coords, phi=phi, alpha=alpha,
##D                      sigma.sq.prior.shape=sigma.sq.prior.shape,
##D                      sigma.sq.prior.rate=sigma.sq.prior.rate)
##D 
##D print(summary(m.4$p.samples))
##D 
##D 
##D 
##D ##Requires MBA package to
##D ##make surfaces
##D library(MBA)
##D par(mfrow=c(1,2))
##D obs.surf <-
##D   mba.surf(cbind(coords, resid(lm(Y~X1+X2+X3+X4, data=FORMGMT.dat))),
##D                  no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(obs.surf, xaxs = "r", yaxs = "r", main="Observed response")
##D points(coords)
##D contour(obs.surf, add=T)
##D 
##D w.hat <- rowMeans(m.4$sp.effects)
##D w.surf <-
##D   mba.surf(cbind(coords, w.hat), no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(w.surf, xaxs = "r", yaxs = "r", main="Estimated random effects")
##D contour(w.surf, add=T)
##D points(coords, pch=1, cex=1)
##D 
##D 
## End(Not run)



