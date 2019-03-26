library(ITRSelect)


### Name: SAS
### Title: Sequential advantage selection for optimal dynamic treatment
###   regime
### Aliases: SAS SAS.fit
### Keywords: Sequential advantage selection

### ** Examples

## No test: 
## single-stage study
set.seed(12345)
n <- 200
p <- 200
X <- matrix(rnorm(n*p), nrow=n, ncol=p)
A <- rbinom(n, 1, 0.5)
CX <- (X[,1] + X[,2])
h <- 1 + X[,1] * X[,3]
Y <- h + A*CX + 0.5*rnorm(n)
result <- SAS(Y~X|A)

## two-stage study
set.seed(12345*2)
n <- 200
p <- 200
X1 <- matrix(rnorm(n*p), nrow=n, ncol=p)
A1 <- rbinom(n, 1, 0.5)
X2 <- X1[,1] + A1 + 0.5*rnorm(n)
A2 <- rbinom(n, 1, 0.5)
Y <- A2*(A1 + X2) + A1*X1[,1] + 0.5*rnorm(n)
result <- SAS(Y~X1|A1|X2|A2)
## End(No test)

## single-stage study
set.seed(12345)
n <- 50
p <- 20
X <- matrix(rnorm(n*p), nrow=n, ncol=p)
A <- rbinom(n, 1, 0.5)
CX <- (X[,1] + X[,2])
h <- 1 + X[,1] * X[,3]
Y <- h + A*CX + 0.5*rnorm(n)
result <- SAS(Y~X|A)

## two-stage study
set.seed(12345*2)
n <- 50
p <- 20
X1 <- matrix(rnorm(n*p), nrow=n, ncol=p)
A1 <- rbinom(n, 1, 0.5)
X2 <- X1[,1] + A1 + 0.5*rnorm(n)
A2 <- rbinom(n, 1, 0.5)
Y <- A2*(A1 + X2) + A1*X1[,1] + 0.5*rnorm(n)
result <- SAS(Y~X1|A1|X2|A2)



