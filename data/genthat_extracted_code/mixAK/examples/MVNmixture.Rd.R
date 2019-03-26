library(mixAK)


### Name: MVNmixture
### Title: Mixture of (multivariate) normal distributions
### Aliases: MVNmixture dMVNmixture dMVNmixture2 rMVNmixture rMVNmixture2
###   C_dmixMVN_R C_dmixNorm_R C_rmixMVN_R C_rmixNorm_R
### Keywords: distribution multivariate

### ** Examples

set.seed(1977)

##### Univariate normal mixture
##### =========================
mu <- c(-1, 1)
Sigma <- c(0.25^2, 0.4^2)
Q <- 1/Sigma
w <- c(0.3, 0.7)

xx <- seq(-2, 2.5, length=100)
yyA <- dMVNmixture(xx, weight=w, mean=mu, Sigma=Sigma)
yyB <- dMVNmixture(xx, weight=w, mean=mu, Q=Q)
yyC <- dMVNmixture2(xx, weight=w, mean=mu, Sigma=Sigma)
yyD <- dMVNmixture2(xx, weight=w, mean=mu, Q=Q)

xxSample <- rMVNmixture(1000, weight=w, mean=mu, Sigma=Sigma)
xxSample2 <- rMVNmixture2(1000, weight=w, mean=mu, Sigma=Sigma)

sum(abs(xxSample2$dens - dMVNmixture(xxSample2$x, weight=w, mean=mu, Sigma=Sigma)) > 1e-15)
xxSample2 <- xxSample2$x

par(mfrow=c(2, 2), bty="n")
plot(xx, yyA, type="l", col="red", xlab="x", ylab="f(x)")
points(xx, yyB, col="darkblue")
hist(xxSample, col="lightblue", prob=TRUE, xlab="x", xlim=range(xx), ylim=c(0, max(yyA)),
     main="Sampled values")
lines(xx, yyA, col="red")
plot(xx, yyC, type="l", col="red", xlab="x", ylab="f(x)")
points(xx, yyD, col="darkblue")
hist(xxSample2, col="sandybrown", prob=TRUE, xlab="x", xlim=range(xx), ylim=c(0, max(yyA)),
     main="Sampled values")
lines(xx, yyC, col="red")


##### Bivariate normal mixture
##### ========================
### Choice 1
sd11 <- sd12 <- 1.1
sd21 <- 0.5
sd22 <- 1.5
rho2 <- 0.7
Xlim <- c(-3, 4)
Ylim <- c(-6, 4)

### Choice 2
sd11 <- sd12 <- 0.3
sd21 <- 0.5
sd22 <- 0.3
rho2 <- 0.8
Xlim <- c(-3, 2.5)
Ylim <- c(-2.5, 2.5)

mu <- matrix(c(1,1, -1,-1), nrow=2, byrow=TRUE)
Sigma <- list(diag(c(sd11^2, sd12^2)),
              matrix(c(sd21^2, rho2*sd21*sd22, rho2*sd21*sd22, sd22^2), nrow=2))
Q <- list(chol2inv(chol(Sigma[[1]])), chol2inv(chol(Sigma[[2]])))
w <- c(0.3, 0.7)

xx1 <- seq(mu[2,1]-3*sd21, mu[1,1]+3*sd11, length=100)
xx2 <- seq(mu[2,2]-3*sd22, mu[1,2]+3*sd12, length=90)
XX <- cbind(rep(xx1, length(xx2)), rep(xx2, each=length(xx1)))
yyA <- matrix(dMVNmixture(XX, weight=w, mean=mu, Sigma=Sigma), nrow=length(xx1), ncol=length(xx2))
yyB <- matrix(dMVNmixture(XX, weight=w, mean=mu, Q=Q), nrow=length(xx1), ncol=length(xx2))
yyC <- matrix(dMVNmixture2(XX, weight=w, mean=mu, Sigma=Sigma), nrow=length(xx1), ncol=length(xx2))
yyD <- matrix(dMVNmixture2(XX, weight=w, mean=mu, Q=Q), nrow=length(xx1), ncol=length(xx2))

#xxSample <- rMVNmixture(1000, weight=w, mean=mu, Sigma=Sigma)
### Starting from version 3.6, the above command led to SegFault
### on CRAN r-patched-solaris-sparc check.
### Commented here on 20140806 (version 3.6-1).
xxSample2 <- rMVNmixture2(1000, weight=w, mean=mu, Sigma=Sigma)

sum(abs(xxSample2$dens - dMVNmixture(xxSample2$x, weight=w, mean=mu, Sigma=Sigma)) > 1e-15)
xxSample2 <- xxSample2$x

par(mfrow=c(1, 2), bty="n")
plot(xxSample, col="darkblue", xlab="x1", ylab="x2", xlim=Xlim, ylim=Ylim)
contour(xx1, xx2, yyA, col="red", add=TRUE)
plot(xxSample2, col="darkblue", xlab="x1", ylab="x2", xlim=Xlim, ylim=Ylim)
contour(xx1, xx2, yyC, col="red", add=TRUE)

par(mfrow=c(2, 2), bty="n")
contour(xx1, xx2, yyA, col="red", xlab="x1", ylab="x2")
points(mu[,1], mu[,2], col="darkgreen")
persp(xx1, xx2, yyA, col="lightblue", xlab="x1", ylab="x2", zlab="f(x1, x2)")
contour(xx1, xx2, yyB, col="red", xlab="x1", ylab="x2")
points(mu[,1], mu[,2], col="darkgreen")
persp(xx1, xx2, yyB, col="lightblue", xlab="x1", ylab="x2", zlab="f(x1, x2)", phi=30, theta=30)

par(mfrow=c(2, 2), bty="n")
contour(xx1, xx2, yyC, col="red", xlab="x1", ylab="x2")
points(mu[,1], mu[,2], col="darkgreen")
persp(xx1, xx2, yyC, col="lightblue", xlab="x1", ylab="x2", zlab="f(x1, x2)")
contour(xx1, xx2, yyD, col="red", xlab="x1", ylab="x2")
points(mu[,1], mu[,2], col="darkgreen")
persp(xx1, xx2, yyD, col="lightblue", xlab="x1", ylab="x2", zlab="f(x1, x2)", phi=30, theta=30)



