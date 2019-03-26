library(spBayes)


### Name: spRecover
### Title: Function for recovering regression coefficients and spatial
###   random effects for 'spLM', 'spMvLM', and 'spMisalignLM' using
###   composition sampling
### Aliases: spRecover
### Keywords: utilities

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
##D n <- 50
##D coords <- cbind(runif(n,0,1), runif(n,0,1))
##D X <- as.matrix(cbind(1, rnorm(n)))
##D 
##D B <- as.matrix(c(1,5))
##D p <- length(B)
##D sigma.sq <- 10
##D tau.sq <- 0.01
##D phi <- 3/0.5
##D 
##D D <- as.matrix(dist(coords))
##D R <- exp(-phi*D)
##D w <- rmvn(1, rep(0,n), sigma.sq*R)
##D y <- rnorm(n, X%*%B + w, sqrt(tau.sq))
##D 
##D n.samples <- 1000
##D 
##D starting <- list("phi"=3/0.5, "sigma.sq"=50, "tau.sq"=1)
##D tuning <- list("phi"=0.1, "sigma.sq"=0.1, "tau.sq"=0.1)
##D priors <- list("beta.Flat", "phi.Unif"=c(3/1, 3/0.1),
##D                "sigma.sq.IG"=c(2, 5), "tau.sq.IG"=c(2, 0.01))
##D cov.model <- "exponential"
##D 
##D m.1 <- spLM(y~X-1, coords=coords, starting=starting, tuning=tuning,
##D             priors=priors, cov.model=cov.model, n.samples=n.samples)
##D 
##D m.1 <- spRecover(m.1, start=0.5*n.samples, thin=2)
##D 
##D summary(window(m.1$p.beta.recover.samples))
##D 
##D w.hat <- apply(m.1$p.w.recover.samples, 1, mean)
##D plot(w, w.hat, xlab="Observed w", ylab="Fitted w")
## End(Not run)



