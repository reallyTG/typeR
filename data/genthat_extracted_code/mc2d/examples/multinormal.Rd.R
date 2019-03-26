library(mc2d)


### Name: multinormal
### Title: The Vectorized Multivariate Random Deviates
### Aliases: multinormal rmultinormal dmultinormal
### Keywords: distribution

### ** Examples

## including equivalence with dmvnorm
## mean and sigma as vectors
(mean <- c(10, 0))
(sigma <- matrix(c(1, 2, 2, 10), ncol=2))
sigma <- as.vector(sigma)
(x <- matrix(c(9, 8, 1, -1), ncol=2))
round(rmultinormal(10, mean, sigma))
dmultinormal(x, mean, sigma) 
## Eq
dmvnorm(x, mean, matrix(sigma, ncol=2)) 

## mean as matrix
(mean <- matrix(c(10, 0, 0, 10), ncol=2))
round(rmultinormal(10, mean, sigma))
dmultinormal(x, mean, sigma)
## Eq
dmvnorm(x[1, ], mean[1, ], matrix(sigma, ncol=2)) 
dmvnorm(x[2, ], mean[2, ], matrix(sigma, ncol=2)) 

## sigma as matrix
(mean <- c(10, 0))
(sigma <- matrix(c(1, 2, 2, 10, 10, 2, 2, 1), nrow=2, byrow=TRUE))
round(rmultinormal(10, mean, sigma))
dmultinormal(x, mean, sigma) 
## Eq
dmvnorm(x[1, ], mean, matrix(sigma[1, ], ncol=2)) 
dmvnorm(x[2, ], mean, matrix(sigma[2, ], ncol=2)) 

## mean and sigma as matrix
(mean <- matrix(c(10, 0, 0, 10), ncol=2))
(sigma <- matrix(c(1, 2, 2, 10, 10, 2, 2, 1), nrow=2, byrow=TRUE))
round(rmultinormal(10, mean, sigma))
dmultinormal(x, mean, sigma) 
## Eq
dmvnorm(x[1, ], mean[1, ], matrix(sigma[1, ], ncol=2)) 
dmvnorm(x[2, ], mean[2, ], matrix(sigma[2, ], ncol=2)) 

(mean <- c(10, 0))
(sigma <- matrix(c(1, 2, 2, 10, 10, 2, 2, 1), nrow=2, byrow=TRUE))
x <- rmultinormal(1000, mean, sigma)
plot(x)




