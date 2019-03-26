library(mixtools)


### Name: hmeEM
### Title: EM Algorithm for Mixtures-of-Experts
### Aliases: hmeEM
### Keywords: file

### ** Examples

## EM output for NOdata.
 
data(NOdata)
attach(NOdata)
set.seed(100)
em.out <- regmixEM(Equivalence, NO)
hme.out <- hmeEM(Equivalence, NO, beta = em.out$beta)
hme.out[3:7]



