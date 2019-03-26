library(gnlm)


### Name: rs3
### Title: Three-factor Box-Tidwell Nonlinear Response Surface Models
### Aliases: rs3
### Keywords: models

### ** Examples


x1 <- rep(1:4,5)
x2 <- rep(1:5,rep(4,5))
x3 <- c(rep(1:3,6),1,2)
#y <- rpois(20,1+2*sqrt(x1)+3*log(x2)+1/x3+4*x1+log(x2)^2+1/x3^2+
#	2*sqrt(x1)*log(x2)+sqrt(x1)/x3+log(x2)/x3)
y <- c(9,11,14,33,11,19,20,27,22,32,24,24,20,28,25,41,26,31,37,34)
rs3(y, x1, x2, x3, family=poisson)




