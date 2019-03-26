library(spBayes)


### Name: adaptMetropGibbs
### Title: Adaptive Metropolis within Gibbs algorithm
### Aliases: adaptMetropGibbs
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
##D ###########################
##D ##Fit a spatial regression
##D ###########################
##D set.seed(1)
##D n <- 50
##D x <- runif(n, 0, 100)
##D y <- runif(n, 0, 100)
##D 
##D D <- as.matrix(dist(cbind(x, y)))
##D 
##D phi <- 3/50
##D sigmasq <- 50
##D tausq <- 20
##D mu <- 150
##D 
##D s <- (sigmasq*exp(-phi*D))
##D w <-  rmvn(1, rep(0, n), s)
##D Y <- rmvn(1, rep(mu, n) + w, tausq*diag(n))
##D X <- as.matrix(rep(1, length(Y)))
##D 
##D ##Priors
##D ##IG sigma^2 and tau^2
##D a.sig <- 2 
##D b.sig <- 100
##D a.tau <- 2
##D b.tau <- 100
##D 
##D ##Unif phi
##D a.phi <- 3/100
##D b.phi <- 3/1
##D 
##D ##Functions used to transform phi to continuous support.
##D logit <- function(theta, a, b){log((theta-a)/(b-theta))}
##D logit.inv <- function(z, a, b){b-(b-a)/(1+exp(z))}
##D 
##D ##Metrop. target
##D target <- function(theta){
##D   
##D   mu.cand <- theta[1]
##D   sigmasq.cand <- exp(theta[2])
##D   tausq.cand <- exp(theta[3])
##D   phi.cand <- logit.inv(theta[4], a.phi, b.phi)
##D 
##D   Sigma <- sigmasq.cand*exp(-phi.cand*D)+tausq.cand*diag(n)
##D   SigmaInv <- chol2inv(chol(Sigma))
##D   logDetSigma <- determinant(Sigma, log=TRUE)$modulus[1]
##D   
##D   out <- (
##D           ##Priors
##D           -(a.sig+1)*log(sigmasq.cand) - b.sig/sigmasq.cand
##D           -(a.tau+1)*log(tausq.cand) - b.tau/tausq.cand
##D           ##Jacobians
##D           +log(sigmasq.cand) + log(tausq.cand) 
##D           +log(phi.cand - a.phi) + log(b.phi -phi.cand) 
##D           ##Likelihood
##D           -0.5*logDetSigma-0.5*(t(Y-X%*%mu.cand)%*%SigmaInv%*%(Y-X%*%mu.cand))
##D           )
##D   
##D   return(out)
##D }
##D 
##D 
##D ##Run a couple chains
##D n.batch <- 500
##D batch.length <- 25
##D 
##D inits <- c(0, log(1), log(1), logit(3/10, a.phi, b.phi))
##D chain.1 <- adaptMetropGibbs(ltd=target, starting=inits,
##D                             batch=n.batch, batch.length=batch.length, report=100)
##D 
##D inits <- c(500, log(100), log(100), logit(3/90, a.phi, b.phi))
##D chain.2 <- adaptMetropGibbs(ltd=target, starting=inits,
##D                             batch=n.batch, batch.length=batch.length, report=100)
##D 
##D ##Check out acceptance rate just for fun
##D plot(mcmc.list(mcmc(chain.1$acceptance), mcmc(chain.2$acceptance)))
##D 
##D ##Back transform
##D chain.1$p.theta.samples[,2] <- exp(chain.1$p.theta.samples[,2])
##D chain.1$p.theta.samples[,3] <- exp(chain.1$p.theta.samples[,3])
##D chain.1$p.theta.samples[,4] <- 3/logit.inv(chain.1$p.theta.samples[,4], a.phi, b.phi)
##D 
##D chain.2$p.theta.samples[,2] <- exp(chain.2$p.theta.samples[,2])
##D chain.2$p.theta.samples[,3] <- exp(chain.2$p.theta.samples[,3])
##D chain.2$p.theta.samples[,4] <- 3/logit.inv(chain.2$p.theta.samples[,4], a.phi, b.phi)
##D 
##D par.names <- c("mu", "sigma.sq", "tau.sq", "effective range (-log(0.05)/phi)")
##D colnames(chain.1$p.theta.samples) <- par.names
##D colnames(chain.2$p.theta.samples) <- par.names
##D 
##D ##Discard burn.in and plot and do some convergence diagnostics
##D chains <- mcmc.list(mcmc(chain.1$p.theta.samples), mcmc(chain.2$p.theta.samples))
##D plot(window(chains, start=as.integer(0.5*n.batch*batch.length)))
##D 
##D gelman.diag(chains)
##D 
##D ##########################
##D ##Example of fitting a
##D ##a non-linear model
##D ##########################
##D ##Example of fitting a non-linear model
##D set.seed(1)
##D 
##D ########################################################
##D ##Simulate some data.
##D ########################################################
##D a <- 0.1 #-Inf < a < Inf
##D b <- 0.1 #b > 0
##D c <- 0.2 #c > 0
##D tau.sq <- 0.1 #tau.sq > 0
##D 
##D fn <- function(a,b,c,x){
##D   a+b*exp(x/c)
##D }
##D 
##D n <- 200
##D x <- seq(0,1,0.01)
##D y <- rnorm(length(x), fn(a,b,c,x), sqrt(tau.sq))
##D 
##D ##check out your data
##D plot(x, y)
##D 
##D ########################################################
##D ##The log target density
##D ########################################################
##D ##Define the log target density used in the Metrop.
##D ltd <- function(theta){
##D 
##D   ##extract and transform as needed
##D   a <- theta[1]
##D   b <- exp(theta[2])
##D   c <- exp(theta[3])
##D   tau.sq <- exp(theta[4])
##D 
##D   y.hat <- fn(a, b, c, x)
##D 
##D   ##likelihood
##D   logl <- sum(dnorm(y, y.hat, sqrt(tau.sq), log=TRUE))
##D 
##D   ##priors IG on tau.sq and normal on a and transformed b, c, d
##D   logl <- (logl
##D            -(IG.a+1)*log(tau.sq)-IG.b/tau.sq
##D            +sum(dnorm(theta[1:3], N.mu, N.v, log=TRUE))
##D            )
##D   
##D   ##Jacobian adjustment for tau.sq
##D   logl <- logl+log(tau.sq)
##D   
##D   return(logl)  
##D }
##D 
##D ########################################################
##D ##The rest
##D ########################################################
##D 
##D ##Priors
##D IG.a <- 2
##D IG.b <- 0.01
##D 
##D N.mu <- 0
##D N.v <- 10
##D 
##D theta.tuning <- c(0.01, 0.01, 0.005, 0.01)
##D 
##D ##Run three chains with different starting values
##D n.batch <- 1000
##D batch.length <- 25
##D 
##D theta.starting <- c(0, log(0.01), log(0.6), log(0.01))
##D run.1 <- adaptMetropGibbs(ltd=ltd, starting=theta.starting, tuning=theta.tuning,
##D                           batch=n.batch, batch.length=batch.length, report=100)
##D 
##D theta.starting <- c(1.5, log(0.05), log(0.5), log(0.05))
##D run.2 <- adaptMetropGibbs(ltd=ltd, starting=theta.starting, tuning=theta.tuning,
##D                           batch=n.batch, batch.length=batch.length, report=100)
##D 
##D theta.starting <- c(-1.5, log(0.1), log(0.4), log(0.1))
##D run.3 <- adaptMetropGibbs(ltd=ltd, starting=theta.starting, tuning=theta.tuning,
##D                           batch=n.batch, batch.length=batch.length, report=100)
##D 
##D ##Back transform
##D samples.1 <- cbind(run.1$p.theta.samples[,1], exp(run.1$p.theta.samples[,2:4]))
##D samples.2 <- cbind(run.2$p.theta.samples[,1], exp(run.2$p.theta.samples[,2:4]))
##D samples.3 <- cbind(run.3$p.theta.samples[,1], exp(run.3$p.theta.samples[,2:4]))
##D 
##D samples <- mcmc.list(mcmc(samples.1), mcmc(samples.2), mcmc(samples.3))
##D 
##D ##Summary 
##D plot(samples, density=FALSE)
##D gelman.plot(samples)
##D 
##D burn.in <- 5000
##D 
##D fn.pred <- function(theta,x){
##D   a <- theta[1]
##D   b <- theta[2]
##D   c <- theta[3]
##D   tau.sq <- theta[4]
##D   
##D   rnorm(length(x), fn(a,b,c,x), sqrt(tau.sq))
##D }
##D 
##D post.curves <- t(apply(samples.1[burn.in:nrow(samples.1),], 1, fn.pred, x))
##D 
##D post.curves.quants <- summary(mcmc(post.curves))$quantiles
##D 
##D plot(x, y, pch=19, xlab="x", ylab="f(x)")
##D lines(x, post.curves.quants[,1], lty="dashed", col="blue")
##D lines(x, post.curves.quants[,3])
##D lines(x, post.curves.quants[,5], lty="dashed", col="blue")
##D 
##D 
## End(Not run)



