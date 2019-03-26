library(MGLM)


### Name: rnegmn
### Title: The Negative Multinomial Distribution
### Aliases: rnegmn negmn dnegmn
### Keywords: distribution models

### ** Examples

###-----------------------###
set.seed(128)
n <- 100
d <- 4
p <- 5
a <- -matrix(1,p,d)
X <- matrix(runif(n*p), n, p )
alpha <- exp(X%*%a)
prob <- alpha/(rowSums(alpha)+1)
beta <- exp(X%*%matrix(1,p)) 
Y <- rnegmn(n, beta, prob)

###-----------------------###
m <- 20
n <- 10
p <- 5
d <- 6
a <- -matrix(1,p,d)
X <- matrix(runif(n*p), n, p )
alpha <- exp(X%*%a)
prob <- alpha/(rowSums(alpha)+1)
b <- exp(X%*%rep(0.3,p)) 
Y <- rnegmn(prob=prob, beta=rep(10, n))
dnegmn(Y, b, prob)




