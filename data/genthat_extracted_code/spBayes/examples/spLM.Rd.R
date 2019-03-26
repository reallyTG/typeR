library(spBayes)


### Name: spLM
### Title: Function for fitting univariate Bayesian spatial regression
###   models
### Aliases: spLM
### Keywords: model

### ** Examples

## Not run: 
##D rmvn <- function(n, mu=0, V = matrix(1)){
##D   p <- length(mu)
##D   if(any(is.na(match(dim(V),p))))
##D     stop("Dimension problem!")
##D   D <- chol(V)
##D   t(matrix(rnorm(n*p), ncol=p)%*%D + rep(mu,rep(n,p)))
##D }
##D 
##D set.seed(1)
##D 
##D n <- 100
##D coords <- cbind(runif(n,0,1), runif(n,0,1))
##D X <- as.matrix(cbind(1, rnorm(n)))
##D 
##D B <- as.matrix(c(1,5))
##D p <- length(B)
##D 
##D sigma.sq <- 2
##D tau.sq <- 0.1
##D phi <- 3/0.5
##D 
##D D <- as.matrix(dist(coords))
##D R <- exp(-phi*D)
##D w <- rmvn(1, rep(0,n), sigma.sq*R)
##D y <- rnorm(n, X%*%B + w, sqrt(tau.sq))
##D 
##D n.samples <- 2000
##D 
##D starting <- list("phi"=3/0.5, "sigma.sq"=50, "tau.sq"=1)
##D 
##D tuning <- list("phi"=0.1, "sigma.sq"=0.1, "tau.sq"=0.1)
##D 
##D priors.1 <- list("beta.Norm"=list(rep(0,p), diag(1000,p)),
##D                  "phi.Unif"=c(3/1, 3/0.1), "sigma.sq.IG"=c(2, 2),
##D                  "tau.sq.IG"=c(2, 0.1))
##D 
##D priors.2 <- list("beta.Flat", "phi.Unif"=c(3/1, 3/0.1),
##D                  "sigma.sq.IG"=c(2, 2), "tau.sq.IG"=c(2, 0.1))
##D 
##D cov.model <- "exponential"
##D 
##D n.report <- 500
##D verbose <- TRUE
##D 
##D m.1 <- spLM(y~X-1, coords=coords, starting=starting,
##D             tuning=tuning, priors=priors.1, cov.model=cov.model,
##D             n.samples=n.samples, verbose=verbose, n.report=n.report)
##D 
##D m.2 <- spLM(y~X-1, coords=coords, starting=starting,
##D             tuning=tuning, priors=priors.2, cov.model=cov.model,
##D             n.samples=n.samples, verbose=verbose, n.report=n.report)
##D 
##D burn.in <- 0.5*n.samples
##D 
##D ##recover beta and spatial random effects
##D m.1 <- spRecover(m.1, start=burn.in, verbose=FALSE)
##D m.2 <- spRecover(m.2, start=burn.in, verbose=FALSE)
##D 
##D round(summary(m.1$p.theta.recover.samples)$quantiles[,c(3,1,5)],2)
##D round(summary(m.2$p.theta.recover.samples)$quantiles[,c(3,1,5)],2)
##D 
##D round(summary(m.1$p.beta.recover.samples)$quantiles[,c(3,1,5)],2)
##D round(summary(m.2$p.beta.recover.samples)$quantiles[,c(3,1,5)],2)
##D 
##D m.1.w.summary <- summary(mcmc(t(m.1$p.w.recover.samples)))$quantiles[,c(3,1,5)]
##D m.2.w.summary <- summary(mcmc(t(m.2$p.w.recover.samples)))$quantiles[,c(3,1,5)]
##D 
##D plot(w, m.1.w.summary[,1], xlab="Observed w", ylab="Fitted w",
##D      xlim=range(w), ylim=range(m.1.w.summary), main="Spatial random effects")
##D arrows(w, m.1.w.summary[,1], w, m.1.w.summary[,2], length=0.02, angle=90)
##D arrows(w, m.1.w.summary[,1], w, m.1.w.summary[,3], length=0.02, angle=90)
##D lines(range(w), range(w))
##D 
##D points(w, m.2.w.summary[,1], col="blue", pch=19, cex=0.5)
##D arrows(w, m.2.w.summary[,1], w, col="blue", m.2.w.summary[,2], length=0.02, angle=90)
##D arrows(w, m.2.w.summary[,1], w, col="blue", m.2.w.summary[,3], length=0.02, angle=90)
##D 
##D ###########################
##D ##Predictive process model
##D ###########################
##D m.1 <- spLM(y~X-1, coords=coords, knots=c(6,6,0.1), starting=starting,
##D             tuning=tuning, priors=priors.1, cov.model=cov.model,
##D             n.samples=n.samples, verbose=verbose, n.report=n.report)
##D 
##D m.2 <- spLM(y~X-1, coords=coords, knots=c(6,6,0.1), starting=starting,
##D             tuning=tuning, priors=priors.2, cov.model=cov.model,
##D             n.samples=n.samples, verbose=verbose, n.report=n.report)
##D 
##D burn.in <- 0.5*n.samples
##D 
##D round(summary(window(m.1$p.beta.samples, start=burn.in))$quantiles[,c(3,1,5)],2)
##D round(summary(window(m.2$p.beta.samples, start=burn.in))$quantiles[,c(3,1,5)],2)
##D 
##D round(summary(window(m.1$p.theta.samples, start=burn.in))$quantiles[,c(3,1,5)],2)
##D round(summary(window(m.2$p.theta.samples, start=burn.in))$quantiles[,c(3,1,5)],2)
## End(Not run)



