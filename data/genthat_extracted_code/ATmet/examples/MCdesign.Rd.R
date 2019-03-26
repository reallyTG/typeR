library(ATmet)


### Name: MCdesign
### Title: Monte Carlo sampling for metrology applications
### Aliases: MCdesign
### Keywords: ~kwd1 ~kwd2

### ** Examples

  
  N<- 100
  k<- 4
  x<- list("X1","X2","X3","X4")
  distrib<- list("norm","norm","unif","t.scaled")
  distrib.pars<- list(list(0,2),list(0,1),list(20,150),list(2,0,1))
  MCdesign(N,k,distrib,distrib.pars,x)



