library(LaplacesDemon)


### Name: dist.Multivariate.t
### Title: Multivariate t Distribution
### Aliases: dmvt rmvt
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y) 
mu <- c(1,12,2)
S <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
df <- 4
f <- dmvt(cbind(x,y,z), mu, S, df)
X <- rmvt(1000, c(0,1,2), S, 5)
joint.density.plot(X[,1], X[,2], color=TRUE)



