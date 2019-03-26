library(spBayes)


### Name: spMvGLM
### Title: Function for fitting multivariate Bayesian generalized linear
###   spatial regression models
### Aliases: spMvGLM
### Keywords: model

### ** Examples

## Not run: 
##D library(MBA)
##D 
##D ##Some useful functions
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
##D weight <- 10 ##i.e., trials 
##D p <- 1/(1+exp(-(x%*%B+w)))
##D y <- rbinom(n*q, size=rep(weight,n*q), prob=p)
##D 
##D y.1 <- y[seq(1,length(y),q)]
##D y.2 <- y[seq(2,length(y),q)]
##D 
##D ##Call spMvLM
##D fit <- glm((y/weight)~x-1, weights=rep(weight, n*q), family="binomial")
##D beta.starting <- coefficients(fit)
##D beta.tuning <- t(chol(vcov(fit)))
##D 
##D A.starting <- diag(1,q)[lower.tri(diag(1,q), TRUE)]
##D 
##D n.batch <- 100
##D batch.length <- 50
##D n.samples <- n.batch*batch.length
##D 
##D starting <- list("beta"=beta.starting, "phi"=rep(3/0.5,q), "A"=A.starting, "w"=0)
##D tuning <- list("beta"=beta.tuning, "phi"=rep(1,q), "A"=rep(0.1,length(A.starting)),
##D                "w"=0.5)
##D priors <- list("beta.Flat", "phi.Unif"=list(rep(3/0.75,q), rep(3/0.25,q)),
##D                "K.IW"=list(q+1, diag(0.1,q)))
##D 
##D m.1 <- spMvGLM(list(y.1~x.1-1, y.2~x.2-1),
##D                coords=coords, weights=matrix(weight,n,q),
##D                starting=starting, tuning=tuning, priors=priors,
##D                amcmc=list("n.batch"=n.batch,"batch.length"=batch.length,"accept.rate"=0.43),
##D                cov.model="exponential", n.report=25)
##D 
##D burn.in <- 0.75*n.samples
##D sub.samps <- burn.in:n.samples
##D 
##D print(summary(window(m.1$p.beta.theta.samples, start=burn.in))$quantiles[,c(3,1,5)])
##D 
##D beta.hat <- t(m.1$p.beta.theta.samples[sub.samps,1:length(B)])
##D w.hat <- m.1$p.w.samples[,sub.samps]
##D 
##D p.hat <- 1/(1+exp(-(x%*%beta.hat+w.hat)))
##D 
##D y.hat <- apply(p.hat, 2, function(x){rbinom(n*q, size=rep(weight, n*q), prob=p)})
##D 
##D y.hat.mu <- apply(y.hat, 1, mean)
##D 
##D ##Unstack to get each response variable fitted values
##D y.hat.mu.1 <- y.hat.mu[seq(1,length(y.hat.mu),q)]
##D y.hat.mu.2 <- y.hat.mu[seq(2,length(y.hat.mu),q)]
##D 
##D ##Take a look
##D par(mfrow=c(2,2))
##D surf <- mba.surf(cbind(coords,y.1),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Observed y.1 positive trials")
##D contour(surf, add=TRUE)
##D points(coords)
##D zlim <- range(surf[["z"]], na.rm=TRUE)
##D 
##D surf <- mba.surf(cbind(coords,y.hat.mu.1),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, zlim=zlim, main="Fitted y.1 positive trials")
##D contour(surf, add=TRUE)
##D points(coords)
##D 
##D surf <- mba.surf(cbind(coords,y.2),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, main="Observed y.2 positive trials")
##D contour(surf, add=TRUE)
##D points(coords)
##D zlim <- range(surf[["z"]], na.rm=TRUE)
##D 
##D surf <- mba.surf(cbind(coords,y.hat.mu.2),no.X=100, no.Y=100, extend=TRUE)$xyz.est
##D image(surf, zlim=zlim, main="Fitted y.2 positive trials")
##D contour(surf, add=TRUE)
##D points(coords)
## End(Not run)



