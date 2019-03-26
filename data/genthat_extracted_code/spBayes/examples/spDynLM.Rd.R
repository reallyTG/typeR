library(spBayes)


### Name: spDynLM
### Title: Function for fitting univariate Bayesian dynamic space-time
###   regression models
### Aliases: spDynLM
### Keywords: model

### ** Examples

## Not run: 
##D data("NETemp.dat")
##D ne.temp <- NETemp.dat
##D 
##D set.seed(1)
##D 
##D ##take a chunk of New England
##D ne.temp <- ne.temp[ne.temp[,"UTMX"] > 5500000 & ne.temp[,"UTMY"] > 3000000,]
##D 
##D ##subset first 2 years (Jan 2000 - Dec. 2002)
##D y.t <- ne.temp[,4:27]
##D N.t <- ncol(y.t) ##number of months
##D n <- nrow(y.t) ##number of observation per months
##D 
##D ##add some missing observations to illistrate prediction
##D miss <- sample(1:N.t, 10)
##D holdout.station.id <- 5
##D y.t.holdout <- y.t[holdout.station.id, miss]
##D y.t[holdout.station.id, miss] <- NA
##D 
##D ##scale to km
##D coords <- as.matrix(ne.temp[,c("UTMX", "UTMY")]/1000)
##D max.d <- max(iDist(coords))
##D 
##D ##set starting and priors
##D p <- 2 #number of regression parameters in each month
##D 
##D starting <- list("beta"=rep(0,N.t*p), "phi"=rep(3/(0.5*max.d), N.t),
##D                  "sigma.sq"=rep(2,N.t), "tau.sq"=rep(1, N.t),
##D                  "sigma.eta"=diag(rep(0.01, p)))
##D 
##D tuning <- list("phi"=rep(5, N.t)) 
##D 
##D priors <- list("beta.0.Norm"=list(rep(0,p), diag(1000,p)),
##D                "phi.Unif"=list(rep(3/(0.9*max.d), N.t), rep(3/(0.05*max.d), N.t)),
##D                "sigma.sq.IG"=list(rep(2,N.t), rep(10,N.t)),
##D                "tau.sq.IG"=list(rep(2,N.t), rep(5,N.t)),
##D                "sigma.eta.IW"=list(2, diag(0.001,p)))
##D 
##D ##make symbolic model formula statement for each month
##D mods <- lapply(paste(colnames(y.t),'elev',sep='~'), as.formula)
##D 
##D n.samples <- 2000
##D 
##D m.1 <- spDynLM(mods, data=cbind(y.t,ne.temp[,"elev",drop=FALSE]), coords=coords,
##D                starting=starting, tuning=tuning, priors=priors, get.fitted =TRUE,
##D                cov.model="exponential", n.samples=n.samples, n.report=25) 
##D 
##D burn.in <- floor(0.75*n.samples)
##D 
##D quant <- function(x){quantile(x, prob=c(0.5, 0.025, 0.975))}
##D 
##D beta <- apply(m.1$p.beta.samples[burn.in:n.samples,], 2, quant)
##D beta.0 <- beta[,grep("Intercept", colnames(beta))]
##D beta.1 <- beta[,grep("elev", colnames(beta))]
##D 
##D plot(m.1$p.beta.0.samples)
##D 
##D par(mfrow=c(2,1))
##D plot(1:N.t, beta.0[1,], pch=19, cex=0.5, xlab="months", ylab="beta.0", ylim=range(beta.0))
##D arrows(1:N.t, beta.0[1,], 1:N.t, beta.0[3,], length=0.02, angle=90)
##D arrows(1:N.t, beta.0[1,], 1:N.t, beta.0[2,], length=0.02, angle=90)
##D 
##D plot(1:N.t, beta.1[1,], pch=19, cex=0.5, xlab="months", ylab="beta.1", ylim=range(beta.1))
##D arrows(1:N.t, beta.1[1,], 1:N.t, beta.1[3,], length=0.02, angle=90)
##D arrows(1:N.t, beta.1[1,], 1:N.t, beta.1[2,], length=0.02, angle=90)
##D 
##D theta <- apply(m.1$p.theta.samples[burn.in:n.samples,], 2, quant)
##D sigma.sq <- theta[,grep("sigma.sq", colnames(theta))]
##D tau.sq <- theta[,grep("tau.sq", colnames(theta))]
##D phi <- theta[,grep("phi", colnames(theta))]
##D 
##D par(mfrow=c(3,1))
##D plot(1:N.t, sigma.sq[1,], pch=19, cex=0.5, xlab="months", ylab="sigma.sq", ylim=range(sigma.sq))
##D arrows(1:N.t, sigma.sq[1,], 1:N.t, sigma.sq[3,], length=0.02, angle=90)
##D arrows(1:N.t, sigma.sq[1,], 1:N.t, sigma.sq[2,], length=0.02, angle=90)
##D 
##D plot(1:N.t, tau.sq[1,], pch=19, cex=0.5, xlab="months", ylab="tau.sq", ylim=range(tau.sq))
##D arrows(1:N.t, tau.sq[1,], 1:N.t, tau.sq[3,], length=0.02, angle=90)
##D arrows(1:N.t, tau.sq[1,], 1:N.t, tau.sq[2,], length=0.02, angle=90)
##D 
##D plot(1:N.t, 3/phi[1,], pch=19, cex=0.5, xlab="months", ylab="eff. range (km)", ylim=range(3/phi))
##D arrows(1:N.t, 3/phi[1,], 1:N.t, 3/phi[3,], length=0.02, angle=90)
##D arrows(1:N.t, 3/phi[1,], 1:N.t, 3/phi[2,], length=0.02, angle=90)
##D 
##D y.hat <- apply(m.1$p.y.samples[,burn.in:n.samples], 1, quant)
##D y.hat.med <- matrix(y.hat[1,], ncol=N.t)
##D y.hat.up <- matrix(y.hat[3,], ncol=N.t)
##D y.hat.low <- matrix(y.hat[2,], ncol=N.t)
##D 
##D y.obs <- as.vector(as.matrix(y.t[-holdout.station.id, -miss]))
##D y.obs.hat.med <- as.vector(y.hat.med[-holdout.station.id, -miss])
##D y.obs.hat.up <- as.vector(y.hat.up[-holdout.station.id, -miss])
##D y.obs.hat.low <- as.vector(y.hat.low[-holdout.station.id, -miss])
##D 
##D y.ho <- as.matrix(y.t.holdout)
##D y.ho.hat.med <- as.vector(y.hat.med[holdout.station.id, miss])
##D y.ho.hat.up <- as.vector(y.hat.up[holdout.station.id, miss])
##D y.ho.hat.low <- as.vector(y.hat.low[holdout.station.id, miss])
##D 
##D par(mfrow=c(2,1))
##D plot(y.obs, y.obs.hat.med, pch=19, cex=0.5, xlab="observed",
##D ylab="fitted", main="Observed vs. fitted")
##D arrows(y.obs, y.obs.hat.med, y.obs, y.obs.hat.up, length=0.02, angle=90)
##D arrows(y.obs, y.obs.hat.med, y.obs, y.obs.hat.low, length=0.02, angle=90)
##D lines(-50:50, -50:50, col="blue")
##D 
##D plot(y.ho, y.ho.hat.med, pch=19, cex=0.5, xlab="observed",
##D ylab="predicted", main="Observed vs. predicted")
##D arrows(y.ho, y.ho.hat.med, y.ho, y.ho.hat.up, length=0.02, angle=90)
##D arrows(y.ho, y.ho.hat.med, y.ho, y.ho.hat.low, length=0.02, angle=90)
##D lines(-50:50, -50:50, col="blue")
## End(Not run)



