library(mixtools)


### Name: logisregmixEM
### Title: EM Algorithm for Mixtures of Logistic Regressions
### Aliases: logisregmixEM
### Keywords: file

### ** Examples

## EM output for data generated from a 2-component logistic regression model.

set.seed(100)
beta <- matrix(c(1, .5, 2, -.8), 2, 2)
x <- runif(50, 0, 10)
x1 <- cbind(1, x)
xbeta <- x1%*%beta
N <- ceiling(runif(50, 50, 75))
w <- rbinom(50, 1, .3)
y <- w*rbinom(50, size = N, prob = (1/(1+exp(-xbeta[, 1]))))+
              (1-w)*rbinom(50, size = N, prob = 
              (1/(1+exp(-xbeta[, 2]))))
out.1 <- logisregmixEM(y, x, N, verb = TRUE, epsilon = 1e-01)
out.1

## EM output for data generated from a 2-component binary logistic regression model.

beta <- matrix(c(-10, .1, 20, -.1), 2, 2)
x <- runif(500, 50, 250)
x1 <- cbind(1, x)
xbeta <- x1%*%beta
w <- rbinom(500, 1, .3)
y <- w*rbinom(500, size = 1, prob = (1/(1+exp(-xbeta[, 1]))))+
              (1-w)*rbinom(500, size = 1, prob = 
              (1/(1+exp(-xbeta[, 2]))))
out.2 <- logisregmixEM(y, x, beta = beta, lambda = c(.3, .7), 
                       verb = TRUE, epsilon = 1e-01)
out.2



