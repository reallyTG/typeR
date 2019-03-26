library(cacIRT)


### Name: class.Lee
### Title: Computes classification accuracy and consistency with Lee's
###   approach.
### Aliases: class.Lee Lee.D Lee.P
### Keywords: ~IRT

### ** Examples

##from rdm, item parameters denote 4 item 1PL test, cut score at x=2
##only print marginal indices

params<-matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)
rdm<-sim(params, rnorm(100))

class.Lee(2, params, rdm = rdm)$Marginal

##or from 40 quadrature points and weights, 2 cut scores

quad <- normal.qu(40)

class.Lee(c(2,3), params, quadrature = quad, D = 1)$Marginal





