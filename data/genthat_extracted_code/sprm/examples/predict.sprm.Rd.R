library(sprm)


### Name: predict.sprm
### Title: Predict method for models of class sprm
### Aliases: predict.sprm

### ** Examples

set.seed(5023)
U1 <- c(rep(2,20), rep(5,30))
U2 <- rep(3.5,50)
X1 <- replicate(5, U1+rnorm(50))
X2 <- replicate(20, U2+rnorm(50))
X <- cbind(X1,X2)
beta <- c(rep(1, 5), rep(0,20))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X%*%beta + e
d <- as.data.frame(X)
d$y <- y
smod <- sprms(y~., data=d, a=1, eta=0.5, fun="Hampel")

dnew <- as.data.frame(cbind(replicate(5, U1+rnorm(10)), replicate(20, U2+rnorm(10))))
ynewp <- predict(smod, newdata=dnew)



