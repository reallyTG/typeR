library(sprm)


### Name: sprm-package
### Title: Sparse and Non-Sparse Partial Robust M Regression and
###   Classification
### Aliases: sprm-package sprm
### Keywords: package

### ** Examples

set.seed(50235)
U1 <- c(rep(3,20), rep(4,30))
U2 <- rep(3.5,50)
X1 <- replicate(5, U1+rnorm(50))
X2 <- replicate(20, U2+rnorm(50))
X <- cbind(X1,X2)
beta <- c(rep(1, 5), rep(0,20))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X%*%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")
smod <- sprms(y~., data=d, a=2, eta=0.5, fun="Hampel")

biplot(mod)
biplot(smod)



