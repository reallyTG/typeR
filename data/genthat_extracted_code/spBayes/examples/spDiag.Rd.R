library(spBayes)


### Name: spDiag
### Title: Model fit diagnostics
### Aliases: spDiag
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
##D n.samples <- 1000
##D 
##D starting <- list("phi"=3/0.5, "sigma.sq"=50, "tau.sq"=1)
##D 
##D tuning <- list("phi"=0.1, "sigma.sq"=0.1, "tau.sq"=0.1)
##D 
##D ##too restrictive of prior on beta
##D priors.1 <- list("beta.Norm"=list(rep(0,p), diag(1,p)),
##D                  "phi.Unif"=c(3/1, 3/0.1), "sigma.sq.IG"=c(2, 2),
##D                  "tau.sq.IG"=c(2, 0.1))
##D 
##D ##more reasonable prior for beta
##D priors.2 <- list("beta.Norm"=list(rep(0,p), diag(1000,p)),
##D                  "phi.Unif"=c(3/1, 3/0.1), "sigma.sq.IG"=c(2, 2),
##D                  "tau.sq.IG"=c(2, 0.1))
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
##D ##non-spatial model
##D m.3 <- spLM(y~X-1, n.samples=n.samples, verbose=verbose, n.report=n.report)
##D 
##D burn.in <- 0.5*n.samples
##D 
##D ##recover beta and spatial random effects
##D m.1 <- spRecover(m.1, start=burn.in, verbose=FALSE)
##D m.2 <- spRecover(m.2, start=burn.in, verbose=FALSE)
##D 
##D ##lower is better for DIC, GPD, and GRS
##D print(spDiag(m.1))
##D print(spDiag(m.2))
##D print(spDiag(m.3))
## End(Not run)



