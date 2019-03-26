library(LCAextend)


### Name: optim.const.ordi
### Title: performs the M step for the measurement distribution parameters
###   in multinomial case, with an ordinal constraint on the parameters
### Aliases: optim.const.ordi

### ** Examples

#data
data(ped.ordi)
status <- ped.ordi[,6]
y <- ped.ordi[,7:ncol(ped.ordi)]
data(peel)
#probs and param
data(probs)
data(param.ordi)
#e step
weight <- e.step(ped.ordi,probs,param.ordi,dens.prod.ordi,peel,x=NULL,
                 var.list=NULL,famdep=TRUE)$w
weight <- matrix(weight[,1,1:length(probs$p)],nrow=nrow(ped.ordi),
                 ncol=length(probs$p))
#the function
optim.const.ordi(y[status==2,],status,weight,param.ordi,x=NULL,
                 var.list=NULL)



