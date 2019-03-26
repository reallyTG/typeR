library(TwoCop)


### Name: TwoCop
### Title: Nonparametric test of equality between two copulas
### Aliases: TwoCop
### Keywords: nonparametric multivariate htest copula ranks

### ** Examples


# Simulating a bivariate normal (copula = independence)

  X=matrix(rnorm(100),ncol=2)

# Simulating a bivriate exponential distribution with a Clayton copula

  v=runif(50)
  theta=1
  x<-1/(1/runif(50)/v^(theta+1))^(1/(theta+1))
  u<-(x^(-theta)-v^(-theta)+1)^(-1/theta)
  Y=cbind(-log(1-u),-log(1-v))
  
# Testing equality of the copulas

  TwoCop(X,Y)$pvalue



