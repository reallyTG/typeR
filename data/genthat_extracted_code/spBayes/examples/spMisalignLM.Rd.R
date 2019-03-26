library(spBayes)


### Name: spMisalignLM
### Title: Function for fitting multivariate Bayesian spatial regression
###   models to misaligned data
### Aliases: spMisalignLM
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
##D ##generate some data
##D n <- 100 ##number of locations
##D q <- 3 ##number of outcomes at each location
##D nltr <- q*(q+1)/2 ##number of triangular elements in the cross-covariance matrix
##D 
##D coords <- cbind(runif(n,0,1), runif(n,0,1))
##D 
##D ##parameters for generating a multivariate spatial GP covariance matrix
##D theta <- rep(3/0.5,q) ##spatial decay
##D 
##D A <- matrix(0,q,q)
##D A[lower.tri(A,TRUE)] <- c(1,1,-1,1,0.5,0.25)
##D K <- A%*%t(A)
##D K ##spatial cross-covariance
##D cov2cor(K) ##spatial cross-correlation
##D 
##D C <- mkSpCov(coords, K, diag(0,q), theta, cov.model="exponential")
##D 
##D w <- rmvn(1, rep(0,nrow(C)), C) ##spatial random effects
##D 
##D w.a <- w[seq(1,length(w),q)]
##D w.b <- w[seq(2,length(w),q)]
##D w.c <- w[seq(3,length(w),q)]
##D 
##D ##covariate portion of the mean
##D x.a <- cbind(1, rnorm(n))
##D x.b <- cbind(1, rnorm(n))
##D x.c <- cbind(1, rnorm(n))
##D x <- mkMvX(list(x.a, x.b, x.c))
##D 
##D B.1 <- c(1,-1)
##D B.2 <- c(-1,1)
##D B.3 <- c(-1,-1)
##D B <- c(B.1, B.2, B.3)
##D 
##D Psi <- c(0.1, 0.1, 0.1) ##non-spatial residual variance, i.e., nugget
##D 
##D y <- rnorm(n*q, x%*%B+w, rep(sqrt(Psi),n))
##D 
##D y.a <- y[seq(1,length(y),q)]
##D y.b <- y[seq(2,length(y),q)]
##D y.c <- y[seq(3,length(y),q)]
##D 
##D ##subsample to make spatially misaligned data
##D sub.1 <- 1:50
##D y.1 <- y.a[sub.1]
##D w.1 <- w.a[sub.1]
##D coords.1 <- coords[sub.1,]
##D x.1 <- x.a[sub.1,]
##D 
##D sub.2 <- 25:75
##D y.2 <- y.b[sub.2]
##D w.2 <- w.b[sub.2]
##D coords.2 <- coords[sub.2,]
##D x.2 <- x.b[sub.2,]
##D 
##D sub.3 <- 50:100
##D y.3 <- y.c[sub.3]
##D w.3 <- w.c[sub.3]
##D coords.3 <- coords[sub.3,]
##D x.3 <- x.c[sub.3,]
##D 
##D ##call spMisalignLM
##D q <- 3
##D A.starting <- diag(1,q)[lower.tri(diag(1,q), TRUE)]
##D n.samples <- 5000
##D 
##D starting <- list("phi"=rep(3/0.5,q), "A"=A.starting, "Psi"=rep(1,q))
##D tuning <- list("phi"=rep(0.5,q), "A"=rep(0.01,length(A.starting)), "Psi"=rep(0.1,q))
##D priors <- list("phi.Unif"=list(rep(3/0.75,q), rep(3/0.25,q)),
##D                "K.IW"=list(q+1, diag(0.1,q)), "Psi.ig"=list(rep(2,q), rep(0.1,q)))
##D 
##D m.1 <- spMisalignLM(list(y.1~x.1-1, y.2~x.2-1, y.3~x.3-1), 
##D                     coords=list(coords.1, coords.2, coords.3),
##D                     starting=starting, tuning=tuning, priors=priors, 
##D                     n.samples=n.samples, cov.model="exponential", n.report=100)
##D 
##D burn.in <- floor(0.75*n.samples)
##D 
##D plot(m.1$p.theta.samples, density=FALSE)
##D 
##D ##recover regression coefficients and random effects
##D m.1 <- spRecover(m.1, start=burn.in)
##D 
##D round(summary(m.1$p.theta.recover.samples)$quantiles[,c(3,1,5)],2)
##D round(summary(m.1$p.beta.recover.samples)$quantiles[,c(3,1,5)],2)
##D 
##D ##predict for all locations, i.e., observed and not observed
##D out <- spPredict(m.1, start=burn.in, thin=10, pred.covars=list(x.a, x.b,
##D x.c), 
##D                  pred.coords=list(coords, coords, coords))
##D 
##D ##summary and check
##D quants <- function(x){quantile(x, prob=c(0.5,0.025,0.975))}
##D 
##D y.hat <- apply(out$p.y.predictive.samples, 1, quants)
##D 
##D ##unstack and plot
##D y.a.hat <- y.hat[,1:n]
##D y.b.hat <- y.hat[,(n+1):(2*n)]
##D y.c.hat <- y.hat[,(2*n+1):(3*n)]
##D 
##D par(mfrow=c(1,3))
##D plot(y.a, y.a.hat[1,], xlab="Observed y.a", ylab="Fitted & predicted y.a",
##D      xlim=range(y), ylim=range(y.hat), main="")
##D arrows(y.a[-sub.1], y.a.hat[1,-sub.1], y.a[-sub.1], y.a.hat[2,-sub.1], length=0.02, angle=90)
##D arrows(y.a[-sub.1], y.a.hat[1,-sub.1], y.a[-sub.1], y.a.hat[3,-sub.1], length=0.02, angle=90)
##D lines(range(y.a), range(y.a))
##D 
##D plot(y.b, y.b.hat[1,], xlab="Observed y.b", ylab="Fitted & predicted y.b",
##D      xlim=range(y), ylim=range(y.hat), main="")
##D arrows(y.b[-sub.2], y.b.hat[1,-sub.2], y.b[-sub.2], y.b.hat[2,-sub.2], length=0.02, angle=90)
##D arrows(y.b[-sub.2], y.b.hat[1,-sub.2], y.b[-sub.2], y.b.hat[3,-sub.2], length=0.02, angle=90)
##D lines(range(y.b), range(y.b))
##D 
##D plot(y.c, y.c.hat[1,], xlab="Observed y.c", ylab="Fitted & predicted y.c",
##D      xlim=range(y), ylim=range(y.hat), main="")
##D arrows(y.c[-sub.3], y.c.hat[1,-sub.3], y.c[-sub.3], y.c.hat[2,-sub.3], length=0.02, angle=90)
##D arrows(y.c[-sub.3], y.c.hat[1,-sub.3], y.c[-sub.3], y.c.hat[3,-sub.3], length=0.02, angle=90)
##D lines(range(y.c), range(y.c))
## End(Not run)



