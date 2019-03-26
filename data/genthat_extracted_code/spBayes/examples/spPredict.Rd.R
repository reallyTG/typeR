library(spBayes)


### Name: spPredict
### Title: Function for new locations given a model object
### Aliases: spPredict
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
##D n <- 200
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
##D ##partition the data for out of sample prediction
##D mod <- 1:100
##D y.mod <- y[mod]
##D X.mod <- X[mod,]
##D coords.mod <- coords[mod,]
##D 
##D n.samples <- 1000
##D 
##D starting <- list("phi"=3/0.5, "sigma.sq"=50, "tau.sq"=1)
##D tuning <- list("phi"=0.1, "sigma.sq"=0.1, "tau.sq"=0.1)
##D priors <- list("beta.Flat", "phi.Unif"=c(3/1, 3/0.1),
##D                "sigma.sq.IG"=c(2, 5), "tau.sq.IG"=c(2, 0.01))
##D cov.model <- "exponential"
##D 
##D m.1 <- spLM(y.mod~X.mod-1, coords=coords.mod, starting=starting, tuning=tuning,
##D priors=priors, cov.model=cov.model, n.samples=n.samples)
##D 
##D m.1.pred <- spPredict(m.1, pred.covars=X, pred.coords=coords,
##D start=0.5*n.samples)
##D 
##D y.hat <- apply(m.1.pred$p.y.predictive.samples, 1, mean)
##D 
##D quant <- function(x){quantile(x, prob=c(0.025, 0.5, 0.975))}
##D 
##D y.hat <- apply(m.1.pred$p.y.predictive.samples, 1, quant)
##D 
##D plot(y, y.hat[2,], pch=19, cex=0.5, xlab="observed y", ylab="predicted y")
##D arrows(y[-mod], y.hat[2,-mod], y[-mod], y.hat[1,-mod], angle=90, length=0.05)
##D arrows(y[-mod], y.hat[2,-mod], y[-mod], y.hat[3,-mod], angle=90, length=0.05)
## End(Not run)



