library(prabclus)


### Name: prab.sarestimate
### Title: Estimates SAR model from log-abundance matrix of prab-object.
### Aliases: prab.sarestimate
### Keywords: spatial

### ** Examples

  options(digits=4)
  data(siskiyou)
  x <- prabinit(prabmatrix=siskiyou, neighborhood=siskiyou.nb,
             distance="none")
#  Not run; this needs package spdep 
#  prab.sarestimate(x)
  prab.sarestimate(x, sar=FALSE)



