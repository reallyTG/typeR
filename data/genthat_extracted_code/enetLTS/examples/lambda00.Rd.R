library(enetLTS)


### Name: lambda00
### Title: Upper limit of the penalty parameter for 'family="binomial"'
### Aliases: lambda00
### Keywords: robust

### ** Examples

set.seed(86)
n <- 100; p <- 25                             # number of observations and variables
beta <- rep(0,p); beta[1:6] <- 1              # 10% nonzero coefficients
sigma <- 0.5                                  # controls signal-to-noise ratio
x <- matrix(rnorm(n*p, sigma),nrow=n)
e <- rnorm(n,0,1)                             # error terms
eps <-0.05                                    # %10 contamination to only class 0
m <- ceiling(eps*n)
y <- sample(0:1,n,replace=TRUE)
xout <- x
xout[y==0,][1:m,] <- xout[1:m,] + 10;         # class 0
yout <- y                                     # wrong classification for vertical outliers

# compute smallest value of the upper limit for the penalty parameter
l00 <- lambda00(xout,yout)



