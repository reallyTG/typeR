library(GPFDA)


### Name: gpr
### Title: Gaussian Process regression for single curve
### Aliases: gpr

### ** Examples

library(GPFDA)
library(MASS) ## used to generate data
hp <- list('pow.ex.w'=log(10),'linear.a'=log(10),'pow.ex.v'=log(5),
      'vv'=log(1))
c <- seq(0,1,len=40)
idx <- sort(sample(1:40,21))
X <- as.matrix(c[idx])
Y <- (mvrnorm(n=40,mu=c-c,Sigma=(cov.linear(hp,c)+cov.pow.ex(hp,c)))[,1]
      )*0.1+sin(c*6)
Y <- as.matrix(Y[idx])
x <- as.matrix(seq(0,1,by=0.03))
a <- gpr(X,Y,c('linear','pow.ex'))

## NOT RUN
## Further codes to provide preditions and plot can be found in demos, for example
## > demo('gpr_ex1')
## END



