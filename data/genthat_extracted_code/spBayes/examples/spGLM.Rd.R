library(spBayes)


### Name: spGLM
### Title: Function for fitting univariate Bayesian generalized linear
###   spatial regression models
### Aliases: spGLM
### Keywords: model

### ** Examples

## Not run: 
##D library(MBA)
##D 
##D set.seed(1)
##D 
##D rmvn <- function(n, mu=0, V = matrix(1)){
##D   p <- length(mu)
##D   if(any(is.na(match(dim(V),p))))
##D     stop("Dimension problem!")
##D   D <- chol(V)
##D   t(matrix(rnorm(n*p), ncol=p) %*% D + rep(mu,rep(n,p)))
##D }
##D 
##D ################################
##D ##Spatial binomial
##D ################################
##D 
##D ##Generate binary data
##D coords <- as.matrix(expand.grid(seq(0,100,length.out=8), seq(0,100,length.out=8)))
##D n <- nrow(coords)
##D 
##D phi <- 3/50
##D sigma.sq <- 2
##D 
##D R <- sigma.sq*exp(-phi*as.matrix(dist(coords)))
##D w <- rmvn(1, rep(0,n), R)
##D 
##D x <- as.matrix(rep(1,n))
##D beta <- 0.1
##D p <- 1/(1+exp(-(x%*%beta+w)))
##D 
##D weights <- rep(1, n)
##D weights[coords[,1]>mean(coords[,1])] <- 10
##D 
##D y <- rbinom(n, size=weights, prob=p)
##D 
##D ##Collect samples
##D fit <- glm((y/weights)~x-1, weights=weights, family="binomial")
##D beta.starting <- coefficients(fit)
##D beta.tuning <- t(chol(vcov(fit)))
##D 
##D n.batch <- 200
##D batch.length <- 50
##D n.samples <- n.batch*batch.length
##D 
##D m.1 <- spGLM(y~1, family="binomial", coords=coords, weights=weights, 
##D              starting=list("beta"=beta.starting, "phi"=0.06,"sigma.sq"=1, "w"=0),
##D              tuning=list("beta"=beta.tuning, "phi"=0.5, "sigma.sq"=0.5, "w"=0.5),
##D              priors=list("beta.Normal"=list(0,10), "phi.Unif"=c(0.03, 0.3), "sigma.sq.IG"=c(2, 1)),
##D              amcmc=list("n.batch"=n.batch, "batch.length"=batch.length, "accept.rate"=0.43),
##D              cov.model="exponential", verbose=TRUE, n.report=10)
##D 
##D burn.in <- 0.9*n.samples
##D sub.samps <- burn.in:n.samples
##D 
##D print(summary(window(m.1$p.beta.theta.samples, start=burn.in)))
##D 
##D beta.hat <- m.1$p.beta.theta.samples[sub.samps,"(Intercept)"]
##D w.hat <- m.1$p.w.samples[,sub.samps]
##D 
##D p.hat <- 1/(1+exp(-(x%*%beta.hat+w.hat)))
##D 
##D y.hat <- apply(p.hat, 2, function(x){rbinom(n, size=weights, prob=p)})
##D 
##D y.hat.mu <- apply(y.hat, 1, mean)
##D y.hat.var <- apply(y.hat, 1, var)
##D 
##D ##Take a look
##D par(mfrow=c(1,2))
##D surf <- mba.surf(cbind(coords,y.hat.mu),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Interpolated mean of posterior rate\n(observed rate)")
##D contour(surf, add=TRUE)
##D text(coords, label=paste("(",y,")",sep=""))
##D 
##D surf <- mba.surf(cbind(coords,y.hat.var),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Interpolated variance of posterior rate\n(observed #
##D of trials)")
##D contour(surf, add=TRUE)
##D text(coords, label=paste("(",weights,")",sep=""))
##D 
##D ###########################
##D ##Spatial poisson
##D ###########################
##D ##Generate count data
##D set.seed(1)
##D 
##D n <- 100
##D 
##D coords <- cbind(runif(n,1,100),runif(n,1,100))
##D 
##D phi <- 3/50
##D sigma.sq <- 2
##D 
##D R <- sigma.sq*exp(-phi*as.matrix(dist(coords)))
##D w <- rmvn(1, rep(0,n), R)
##D 
##D x <- as.matrix(rep(1,n))
##D beta <- 0.1
##D y <- rpois(n, exp(x%*%beta+w))
##D 
##D ##Collect samples
##D beta.starting <- coefficients(glm(y~x-1, family="poisson"))
##D beta.tuning <- t(chol(vcov(glm(y~x-1, family="poisson"))))
##D 
##D n.batch <- 500
##D batch.length <- 50
##D n.samples <- n.batch*batch.length
##D 
##D ##Note tuning list is now optional
##D 
##D m.1 <- spGLM(y~1, family="poisson", coords=coords,
##D              starting=list("beta"=beta.starting, "phi"=0.06,"sigma.sq"=1, "w"=0),
##D              tuning=list("beta"=0.1, "phi"=0.5, "sigma.sq"=0.5, "w"=0.5),
##D              priors=list("beta.Flat", "phi.Unif"=c(0.03, 0.3), "sigma.sq.IG"=c(2, 1)),
##D              amcmc=list("n.batch"=n.batch, "batch.length"=batch.length, "accept.rate"=0.43),
##D              cov.model="exponential", verbose=TRUE, n.report=10)
##D 
##D ##Just for fun check out the progression of the acceptance
##D ##as it moves to 43% (same can be seen for the random spatial effects).
##D plot(mcmc(t(m.1$acceptance)), density=FALSE, smooth=FALSE)
##D 
##D ##Now parameter summaries, etc.
##D burn.in <- 0.9*n.samples
##D sub.samps <- burn.in:n.samples
##D 
##D m.1$p.samples[,"phi"] <- 3/m.1$p.samples[,"phi"]
##D 
##D plot(m.1$p.beta.theta.samples)
##D print(summary(window(m.1$p.beta.theta.samples, start=burn.in)))
##D 
##D beta.hat <- m.1$p.beta.theta.samples[sub.samps,"(Intercept)"]
##D w.hat <- m.1$p.w.samples[,sub.samps]
##D 
##D y.hat <- apply(exp(x%*%beta.hat+w.hat), 2, function(x){rpois(n, x)})
##D 
##D y.hat.mu <- apply(y.hat, 1, mean)
##D 
##D ##Take a look
##D par(mfrow=c(1,2))
##D surf <- mba.surf(cbind(coords,y),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Observed counts")
##D contour(surf, add=TRUE)
##D text(coords, labels=y, cex=1)
##D 
##D surf <- mba.surf(cbind(coords,y.hat.mu),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Fitted counts")
##D contour(surf, add=TRUE)
##D text(coords, labels=round(y.hat.mu,0), cex=1)
## End(Not run)



