library(mixtools)


### Name: mvnormalmixEM
### Title: EM Algorithm for Mixtures of Multivariate Normals
### Aliases: mvnormalmixEM
### Keywords: file

### ** Examples

##Fitting randomly generated data with a 2-component location mixture of bivariate normals.

set.seed(100)
x.1 <- rmvnorm(40, c(0, 0))
x.2 <- rmvnorm(60, c(3, 4))
X.1 <- rbind(x.1, x.2)
mu <- list(c(0, 0), c(3, 4))

out.1 <- mvnormalmixEM(X.1, arbvar = FALSE, mu = mu,
                       epsilon = 1e-02)
out.1[2:5]

##Fitting randomly generated data with a 2-component scale mixture of bivariate normals.

x.3 <- rmvnorm(40, c(0, 0), sigma = 
               matrix(c(200, 1, 1, 150), 2, 2))
x.4 <- rmvnorm(60, c(0, 0))
X.2 <- rbind(x.3, x.4)
lambda <- c(0.40, 0.60)
sigma <- list(diag(1, 2), matrix(c(200, 1, 1, 150), 2, 2))
 
out.2 <- mvnormalmixEM(X.2, arbmean = FALSE,
                       sigma = sigma, lambda = lambda,
                       epsilon = 1e-02)
out.2[2:5]



