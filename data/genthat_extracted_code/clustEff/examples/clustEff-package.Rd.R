library(clustEff)


### Name: clustEff-package
### Title: Clusters of effects
### Aliases: clustEff-package
### Keywords: package

### ** Examples


# use simulated data
# CURVES EFFECTS CLUSTERING

set.seed(1234)
n <- 300
q <- 2
k <- 5
x1 <- runif(n, 0, 5)
x2 <- runif(n, 0, 5)

X <- cbind(x1, x2)
rownames(X) <- 1:n
colnames(X) <- paste0("X", 1:q)

theta1 <- matrix(c(1, 1, 0, 0, 0, .5, 0, .5, 1, 2, .5, 0, 2, 1, .5),
                 ncol=k, byrow=TRUE)

theta2 <- matrix(c(1, 1, 0, 0, 0, -.3, 0, .5, 1, .5, -1.5, 0, -1, -.5, 1),
                 ncol=k, byrow=TRUE)

theta3 <- matrix(c(1, 1, 0, 0, 0, .3, 0, -.5, -1, 2, -.5, 0, 1, -.5, -1),
                 ncol=k, byrow=TRUE)

rownames(theta3) <- rownames(theta2) <- rownames(theta1) <-
    c("(intercept)", paste("X", 1:q, sep=""))
colnames(theta3) <- colnames(theta2) <- colnames(theta1) <-
    c("(intercept)", "qnorm(p)", "p", "p^2", "p^3")

Theta <- list(theta1, theta2, theta3)

B <- function(p, k){matrix(cbind(1, qnorm(p), p, p^2, p^3), nrow=k, byrow=TRUE)}
Q <- function(p, theta, B, k, X){rowSums(X * t(theta %*% B(p, k)))}

Y <- matrix(NA, nrow(X), 15)
for(i in 1:15){
  if(i <= 5) Y[, i] <- Q(runif(n), Theta[[1]], B, k, cbind(1, X))
  if(i <= 10 & i > 5) Y[, i] <- Q(runif(n), Theta[[2]], B, k, cbind(1, X))
  if(i <= 15 & i > 10) Y[, i] <- Q(runif(n), Theta[[3]], B, k, cbind(1, X))
}

XX <- extract.object(Y, X, intercept=TRUE, formula.p= ~ I(p) + I(p^2) + I(p^3))
seqP <- XX$p

obj <- clustEff(XX$X$X1, Beta.lower=XX$Xl$X1, Beta.upper=XX$Xr$X1)
summary(obj)
plot(obj, xvar="clusters", add=TRUE)
par(mfrow=c(1,3));plot(obj, xvar="clusters", add=FALSE);par(mfrow=c(1,1))
plot(obj, xvar="dendrogram")
plot(obj, xvar="boxplot")

## Not run: 
##D obj2 <- clustEff(XX$X$X2, Beta.lower=XX$Xl$X2, Beta.upper=XX$Xr$X2)
##D summary(obj2)
##D plot(obj2, xvar="clusters", add=TRUE)
##D par(mfrow=c(1,3));plot(obj2, xvar="clusters", add=FALSE);par(mfrow=c(1,1))
##D plot(obj2, xvar="dendrogram")
##D plot(obj2, xvar="boxplot")
##D 
##D 
##D set.seed(1234)
##D n <- 300
##D q <- 15
##D k <- 5
##D X <- matrix(rnorm(n*q), n, q); X <- scale(X)
##D rownames(X) <- 1:n
##D colnames(X) <- paste0("X", 1:q)
##D 
##D Theta <- matrix(c(1, 1, 0, 0, 0,
##D                   .5, 0, .5, 1, 1,
##D                   .5, 0, 1, 2, .5,
##D                    .5, 0, 1, 1, .5,
##D                   .5, 0, .5, 1, 1,
##D                    .5, 0, .5, 1, .5,
##D                  -1.5, 0, -.5, 1, 1,
##D                   -1, 0, .5, -1, -1,
##D                  -.5, 0, -.5, -1, .5,
##D                   -1, 0, .5, -1, -.5,
##D                 -1.5, 0, -.5, -1, -.5,
##D                   2, 0, 1, 1.5, 2,
##D                   2, 0, .5, 1.5, 2,
##D                   2.5, 0, 1, 1, 2,
##D                   1.5, 0, 1.5, 1, 2,
##D                   3, 0, 2, 1, .5),
##D                  ncol=k, byrow=TRUE)
##D rownames(Theta) <- c("(intercept)", paste("X", 1:q, sep=""))
##D colnames(Theta) <- c("(intercept)", "qnorm(p)", "p", "p^2", "p^3")
##D 
##D B <- function(p, k){matrix(cbind(1, qnorm(p), p, p^2, p^3), nrow=k, byrow=TRUE)}
##D Q <- function(p, theta, B, k, X){rowSums(X * t(theta %*% B(p, k)))}
##D 
##D s <- matrix(1, q+1, k)
##D s[2:(q+1), 2] <- 0
##D s[1, 3:k] <- 0
##D 
##D Y <- Q(runif(n), Theta, B, k, cbind(1, X))
##D XX <- iqr(Y ~ X, formula.p= ~ I(p) + I(p^2) + I(p^3))
##D seqP <- seq(.01, .99, l=100)
##D predObj <- predict(XX, type="beta", p=seqP)
##D X2 <- Xl <- Xr <- matrix(NA, nrow=length(seqP), ncol=(dim(coef(XX))[1]-1))
##D for(i in 2:dim(coef(XX))[1]){
##D   X2[, (i-1)] <- predObj[[i]][, 2]
##D   Xl[, (i-1)] <- predObj[[i]][, 4]
##D   Xr[, (i-1)] <- predObj[[i]][, 5]
##D }
##D 
##D obj <- clustEff(X2, Beta.lower=Xl, Beta.upper=Xr)
##D summary(obj)
##D plot(obj, xvar="clusters", add=TRUE)
##D par(mfrow=c(1,3));plot(obj, xvar="clusters", add=FALSE);par(mfrow=c(1,1))
##D plot(obj, xvar="dendrogram")
##D plot(obj, xvar="boxplot")
##D 
##D 
##D # CURVES CLUSTERING IN FUNCTIONAL DATA ANALYSIS
##D 
##D set.seed(1234)
##D n <- 300
##D x <- 1:n/n
##D 
##D Y <- matrix(0, n, 30)
##D 
##D sigma2 <- 4*pmax(x-.2, 0) - 8*pmax(x-.5, 0) + 4*pmax(x-.8, 0)
##D 
##D mu <- sin(3*pi*x)
##D for(i in 1:10) Y[, i] <- mu + rnorm(length(x), 0, pmax(sigma2, 0))
##D 
##D mu <- cos(3*pi*x)
##D for(i in 11:23) Y[,i] <- mu + rnorm(length(x), 0, pmax(sigma2,0))
##D 
##D mu <- sin(3*pi*x)*cos(pi*x)
##D for(i in 24:28) Y[, i] <- mu + rnorm(length(x), 0, pmax(sigma2, 0))
##D 
##D mu <- 0 #sin(1/3*pi*x)*cos(2*pi*x)
##D for(i in 29:30) Y[, i] <- mu + rnorm(length(x), 0, pmax(sigma2, 0))
##D 
##D obj2 <- clustEff(Y, cluster.effects=FALSE)
##D summary(obj2)
##D plot(obj2, xvar="clusters", add=TRUE)
##D par(mfrow=c(2,2));plot(obj2, xvar="clusters", add=FALSE);par(mfrow=c(1,1))
##D plot(obj2, xvar="dendrogram")
##D plot(obj2, xvar="boxplot")
## End(Not run)




