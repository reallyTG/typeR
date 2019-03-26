library(dbstats)


### Name: predict.ldblm
### Title: Predicted values for a ldblm object
### Aliases: predict.ldblm print.predict.ldblm

### ** Examples


# example to use of the predict.ldblm function

n <- 100
p <- 1
k <- 5

Z <- matrix(rnorm(n*p),nrow=n)
b1 <- matrix(runif(p)*k,nrow=p)
b2 <- matrix(runif(p)*k,nrow=p)
b3 <- matrix(runif(p)*k,nrow=p)

s <- 1
e <- rnorm(n)*s

y <- Z%*%b1 + Z^2%*%b2 +Z^3%*%b3 + e

D <- as.matrix(dist(Z))
D2 <- D^2

newdata1 <- 0

ldblm1 <- ldblm(y~Z,kind.of.kernel=1,method="GCV",noh=3,k.knn=3)
pr1 <- predict(ldblm1,newdata1)
print(pr1)
plot(Z,y)
points(0,pr1$fit,col=2)
abline(v=0,col=2)
abline(h=pr1$fit,col=2)




