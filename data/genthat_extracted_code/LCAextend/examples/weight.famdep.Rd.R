library(LCAextend)


### Name: weight.famdep
### Title: performs the computation of triplet and individual weights for a
###   pedigree under familial dependence
### Aliases: weight.famdep

### ** Examples

#data
data(ped.cont)
data(peel)
fam <- ped.cont[,1]
id <- ped.cont[fam==1,2]
dad <- ped.cont[fam==1,3]
mom <- ped.cont[fam==1,4]
status <- ped.cont[fam==1,6]
y <- ped.cont[fam==1,7:ncol(ped.cont)]
peel <- peel[[1]]
#probs and param
data(probs)
data(param.cont)
#densities of the observations
fyc <- matrix(1,nrow=length(id),ncol=length(probs$p)+1)
fyc[status==2,1:length(probs$p)] <- t(apply(y[status==2,],1,dens.norm,
                                      param.cont,NULL))
#the function
weight.famdep(id,dad,mom,status,probs,fyc,peel)



