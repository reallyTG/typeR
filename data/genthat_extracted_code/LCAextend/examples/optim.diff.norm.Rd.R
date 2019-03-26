library(LCAextend)


### Name: optim.diff.norm
### Title: performs the M step for measurement density parameters in
###   multinormal case
### Aliases: optim.diff.norm

### ** Examples

#data
data(ped.cont)
status <- ped.cont[,6]
y <- ped.cont[,7:ncol(ped.cont)]
data(peel)
#probs and param
data(probs)
data(param.cont)
#e step
weight <- e.step(ped.cont,probs,param.cont,dens.norm,peel,x=NULL,
                 var.list=NULL,famdep=TRUE)$w
weight <- matrix(weight[,1,1:length(probs$p)],nrow=nrow(ped.cont),
                 ncol=length(probs$p))
#the function
optim.diff.norm(y[status==2,],status,weight,param.cont,x=NULL,
                 var.list=NULL)



