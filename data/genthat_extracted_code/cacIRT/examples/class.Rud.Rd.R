library(cacIRT)


### Name: class.Rud
### Title: Computes classification accuracy and consistency with Rudner's
###   approach.
### Aliases: class.Rud Rud.P Rud.D
### Keywords: ~IRT

### ** Examples

##from rdm, item parameters denote 4 item 1PL test, cut score at theta=.5
##only return marginal indices

params<-matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)
rdm<-sim(params, rnorm(100))

class.Rud(.5, params, rdm = rdm)$Marginal

##or from 40 quadrature points and weights, 2 cut scores

quad <- normal.qu(40)

class.Rud(c(-.5,1.5), params, quadrature = quad, D = 1)$Marginal




