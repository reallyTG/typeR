library(splus2R)


### Name: vecnorm
### Title: p-norm of a vector
### Aliases: vecnorm
### Keywords: utilities

### ** Examples

## compare 2-norm calculations 
x <- rnorm(100)
sqrt(sum(x*x))
vecnorm(x)

## compare 2-norm of series which sums to Inf. The 
## vecnorm returns a finite value in this case. 
x <- rep(sqrt(.Machine$double.xmax), 4)
sqrt(sum(x*x))
vecnorm(x)

## 1-norm comparison 
sum(abs(x))
vecnorm(x, p=1)

## L-infinity norm comparison 
max(abs(x))
vecnorm(x, p=Inf)



