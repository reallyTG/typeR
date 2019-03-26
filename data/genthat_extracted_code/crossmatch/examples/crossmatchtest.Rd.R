library(crossmatch)


### Name: crossmatchtest
### Title: The Cross-Match Test
### Aliases: crossmatchtest

### ** Examples


## The example in Section 2 of the article (see References)

#The data consists of 2 outcomes measured on 9 treated cases and 9 controls: 
dat <- rbind(c(0.47,0.39,0.47,0.78,1,1,0.54,1,0.38,1,0.27,0.63,0.22,0,-1,-0.42,-1,-1),
             c(0.03,0.11,0.16,-0.1,-0.05,0.16,0.12,0.4,0.04,0.71,0.01,0.21,-0.18,-0.08             ,-0.35,0.26,-0.6,-1.0))
z <- c(rep(0,9),rep(1,9))
X <- t(dat)

## Rank based Mahalanobis distance between each pair:
X <- as.matrix(X)
n <- dim(X)[1]
k <- dim(X)[2]
for (j in 1:k) X[,j] <- rank(X[,j])
cv <- cov(X)
vuntied <- var(1:n)
rat <- sqrt(vuntied/diag(cv))
cv <- diag(rat)%*%cv%*%diag(rat)
out <- matrix(NA,n,n)

library(MASS)

icov <- ginv(cv)
for (i in 1:n) out[i,] <- mahalanobis(X,X[i,],icov,inverted=TRUE)

dis <- out

## The cross-match test:

crossmatchtest(z,dis)



