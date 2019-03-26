library(NPCirc)


### Name: dcircmix
### Title: Mixtures of circular distributions
### Aliases: dcircmix rcircmix
### Keywords: circular density

### ** Examples

set.seed(2012)
# Circular representation of models M1-M20, each one in a separate window
for (i in 1:20){
dev.new()
f <- function(x) dcircmix(x, model=i)
curve.circular(f, n=500, join=TRUE, shrink=1.9, main=i)
}

# Random generation from model M1 (uniform model)
data1 <- rcircmix(50, model=1)
plot(data1)

# Density function and random generation from a mixture of a von Mises and
# a wrapped skew-normal
f <- function(x) dcircmix(x, model=NULL, dist=c("vm","wsn"),
param=list(p=c(0.5,0.5), mu=c(0,pi), con=c(1,1), sk=c(0,10)))
curve.circular(f, n=500, shrink=1.2)
data <- rcircmix(100, model=NULL, dist=c("vm","wsn"),
param=list(p=c(0.5,0.5), mu=c(0,pi), con=c(1,1), sk=c(0,10)))
points(data)

# Density function and random generation from a mixture of two von Mises and
# two wrapped Cauchy
f <- function(x) dcircmix(x, model=NULL, dist=c("vm","vm","wc","wc"),
param=list(p=c(0.3,0.3,0.2,0.2), mu=c(0,pi,pi/2,3*pi/2), con=c(5,5,0.9,0.9)))
curve.circular(f, n=1000, xlim=c(-1.65,1.65))
data <- rcircmix(100, model=NULL, dist=c("vm","vm","wc","wc"),
param=list(p=c(0.3,0.3,0.2,0.2), mu=c(0,pi,pi/2,3*pi/2), con=c(5,5,0.9,0.9)))
points(data)



