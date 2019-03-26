library(FAmle)


### Name: distr
### Title: Distribution functions 4-in-1
### Aliases: distr
### Keywords: distribution

### ** Examples

## Example 1
dnorm(-4:4,0,1,log=TRUE)
distr(-4:4,'norm',c(0,1),type='d',log=TRUE)

## Example 2
mu.vec <- c(1,100,100)
sigma.vec <- c(1,11,111)
n <- 3
set.seed(123)
rnorm(n,mu.vec,sigma.vec)
set.seed(123)
distr(n,'norm',cbind(mu.vec,sigma.vec),'r')

## Example 3
qnorm(.9,mu.vec,sigma.vec)
distr(.9,'norm',cbind(mu.vec,sigma.vec),'q')




