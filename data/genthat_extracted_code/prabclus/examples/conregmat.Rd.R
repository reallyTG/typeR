library(prabclus)


### Name: con.regmat
### Title: Connected regions per species
### Aliases: con.regmat
### Keywords: spatial cluster

### ** Examples

data(nb)
set.seed(888) 
cp <- cluspop.nb(nb, p.nb=0.1, n.species=10, clus.specs=9,
                 reg.group=1:17,vector.species=c(10))
con.regmat(cp,nb)



