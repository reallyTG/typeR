library(gnlm)


### Name: rs2
### Title: Two-factor Box-Tidwell Nonlinear Response Surface Models
### Aliases: rs2
### Keywords: models

### ** Examples


x1 <- rep(1:4,5)
x2 <- rep(1:5,rep(4,5))
y <- rpois(20,1+2*sqrt(x1)+3*log(x2)+4*x1+log(x2)^2+2*sqrt(x1)*log(x2))
rs2(y, x1, x2, family=poisson)




