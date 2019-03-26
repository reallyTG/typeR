library(spBayes)


### Name: spMvLM
### Title: Function for fitting multivariate Bayesian spatial regression
###   models
### Aliases: spMvLM
### Keywords: model

### ** Examples

## Not run: 
##D rmvn <- function(n, mu=0, V = matrix(1)){
##D   p <- length(mu)
##D   if(any(is.na(match(dim(V),p)))){stop("Dimension problem!")}
##D   D <- chol(V)
##D   t(matrix(rnorm(n*p), ncol=p)%*%D + rep(mu,rep(n,p)))
##D }
##D 
##D set.seed(1)
##D 
##D ##Generate some data
##D n <- 25 ##number of locations
##D q <- 2 ##number of outcomes at each location
##D nltr <- q*(q+1)/2 ##number of triangular elements in the cross-covariance matrix
##D 
##D coords <- cbind(runif(n,0,1), runif(n,0,1))
##D 
##D ##Parameters for the bivariate spatial random effects
##D theta <- rep(3/0.5,q)
##D 
##D A <- matrix(0,q,q)
##D A[lower.tri(A,TRUE)] <- c(1,-1,0.25)
##D K <- A%*%t(A)
##D 
##D Psi <- diag(0,q)
##D 
##D C <- mkSpCov(coords, K, Psi, theta, cov.model="exponential")
##D 
##D w <- rmvn(1, rep(0,nrow(C)), C)
##D 
##D w.1 <- w[seq(1,length(w),q)]
##D w.2 <- w[seq(2,length(w),q)]
##D 
##D ##Covariate portion of the mean
##D x.1 <- cbind(1, rnorm(n))
##D x.2 <- cbind(1, rnorm(n))
##D x <- mkMvX(list(x.1, x.2))
##D 
##D B.1 <- c(1,-1)
##D B.2 <- c(-1,1)
##D B <- c(B.1, B.2)
##D 
##D Psi <- diag(c(0.1, 0.5))
##D 
##D y <- rnorm(n*q, x%*%B+w, diag(n)%x%Psi)
##D 
##D y.1 <- y[seq(1,length(y),q)]
##D y.2 <- y[seq(2,length(y),q)]
##D 
##D ##Call spMvLM
##D A.starting <- diag(1,q)[lower.tri(diag(1,q), TRUE)]
##D n.samples <- 1000
##D 
##D starting <- list("phi"=rep(3/0.5,q), "A"=A.starting, "Psi"=rep(1,q))
##D tuning <- list("phi"=rep(1,q), "A"=rep(0.01,length(A.starting)), "Psi"=rep(0.01,q))
##D priors <- list("beta.Flat", "phi.Unif"=list(rep(3/0.75,q), rep(3/0.25,q)),
##D                "K.IW"=list(q+1, diag(0.1,q)), "Psi.ig"=list(c(2,2), c(0.1,0.1)))
##D 
##D m.1 <- spMvLM(list(y.1~x.1-1, y.2~x.2-1), 
##D                coords=coords, starting=starting, tuning=tuning, priors=priors,
##D                n.samples=n.samples, cov.model="exponential", n.report=100)
##D 
##D burn.in <- 0.75*n.samples
##D 
##D m.1 <- spRecover(m.1, start=burn.in)
##D 
##D round(summary(m.1$p.theta.recover.samples)$quantiles[,c(3,1,5)],2)
##D round(summary(m.1$p.beta.recover.samples)$quantiles[,c(3,1,5)],2)
##D 
##D m.1.w.hat <- summary(mcmc(t(m.1$p.w.recover.samples)))$quantiles[,c(3,1,5)]
##D m.1.w.1.hat <- m.1.w.hat[seq(1, nrow(m.1.w.hat), q),]
##D m.1.w.2.hat <- m.1.w.hat[seq(2, nrow(m.1.w.hat), q),]
##D 
##D par(mfrow=c(1,2))
##D plot(w.1, m.1.w.1.hat[,1], xlab="Observed w.1", ylab="Fitted w.1",
##D      xlim=range(w), ylim=range(m.1.w.hat), main="Spatial random effects w.1")
##D arrows(w.1, m.1.w.1.hat[,1], w.1, m.1.w.1.hat[,2], length=0.02, angle=90)
##D arrows(w.1, m.1.w.1.hat[,1], w.1, m.1.w.1.hat[,3], length=0.02, angle=90)
##D lines(range(w), range(w))
##D 
##D plot(w.2, m.1.w.2.hat[,1], xlab="Observed w.2", ylab="Fitted w.2",
##D      xlim=range(w), ylim=range(m.1.w.hat), main="Spatial random effects w.2")
##D arrows(w.2, m.1.w.2.hat[,1], w.2, m.1.w.2.hat[,2], length=0.02, angle=90)
##D arrows(w.2, m.1.w.2.hat[,1], w.2, m.1.w.2.hat[,3], length=0.02, angle=90)
##D lines(range(w), range(w))
## End(Not run)



