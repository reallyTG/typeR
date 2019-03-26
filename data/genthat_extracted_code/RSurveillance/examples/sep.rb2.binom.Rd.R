library(RSurveillance)


### Name: sep.rb2.binom
### Title: Binomial risk-based population sensitivity for 2 risk factors
### Aliases: sep.rb2.binom
### Keywords: methods

### ** Examples

# examples for sep.rb2.binom
pstar<- 0.01
rr1<- c(3, 1)
ppr1<- c(0.2, 0.8)
rr2<- rbind(c(4,1), c(4,1))
ppr2<- rbind(c(0.1, 0.9), c(0.3, 0.7))
se<- 0.8
n<- rbind(c(50, 20), c(20, 10))
sep.rb2.binom(pstar, rr1, ppr1, rr2, ppr2, n, se)



