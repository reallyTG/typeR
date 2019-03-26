library(RSurveillance)


### Name: sep.rb2.hypergeo
### Title: Hypergeometric risk-based population sensitivity for 2 risk
###   factors
### Aliases: sep.rb2.hypergeo
### Keywords: methods

### ** Examples

# examples for sep.rb2.hypergeo
pstar<- 0.01
rr1<- c(3, 1)
rr2<- rbind(c(4,1), c(4,1))
N<- rbind(c(100, 500), c(300, 1000))
n<- rbind(c(50, 20), c(20, 10))
se<- 0.8
sep.rb2.hypergeo(pstar, rr1, rr2, N, n, se)



