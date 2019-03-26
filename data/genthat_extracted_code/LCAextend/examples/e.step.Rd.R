library(LCAextend)


### Name: e.step
### Title: performs the E step of the EM algorithm for a single pedigree
###   for both cases with and without familial dependence
### Aliases: e.step

### ** Examples

#data
data(ped.cont)
data(peel)
#probs and probs
data(probs)
data(param.cont)
#the function
e.step(ped.cont,probs,param.cont,dens.norm,peel,x=NULL,var.list=NULL,
       famdep=TRUE)



