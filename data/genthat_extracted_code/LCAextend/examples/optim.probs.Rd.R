library(LCAextend)


### Name: optim.probs
### Title: performs the M step of the EM algorithm for the probability
###   parameters
### Aliases: optim.probs

### ** Examples

#data
data(ped.cont)
data(peel)
#probs and param
data(probs)
data(param.cont)
#e step
weight <- e.step(ped.cont,probs,param.cont,dens.norm,peel,x=NULL,
                 var.list=NULL,famdep=TRUE)
#the function
optim.probs(ped.cont,probs,weight,optim.probs.indic=
            c(TRUE,TRUE,TRUE,TRUE),famdep=TRUE)



