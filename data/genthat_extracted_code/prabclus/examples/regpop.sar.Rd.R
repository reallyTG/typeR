library(prabclus)


### Name: regpop.sar
### Title: Simulation of abundance matrices (non-clustered)
### Aliases: regpop.sar
### Keywords: spatial

### ** Examples

options(digits=4)
data(siskiyou)
set.seed(1234)
x <- prabinit(prabmatrix=siskiyou, neighborhood=siskiyou.nb,
             distance="none")
# Not run; this needs package spdep.
# regpop.sar(x, p.nb=0.046)
regpop.sar(x, p.nb=0.046, sarestimate=prab.sarestimate(x,sar=FALSE))



