library(LCAextend)


### Name: p.post.found
### Title: computes the posterior probability of observations of a founder
### Aliases: p.post.found

### ** Examples

#data
data(ped.cont)
fam <- ped.cont[,1]
dad <- ped.cont[fam==1,3]
status <- ped.cont[fam==1,6]
y <- ped.cont[fam==1,7:ncol(ped.cont)]
#a founder
found <- which(dad==0)[1]
data(probs)
data(param.cont)
#densities of the observations
fyc <- matrix(1,nrow=nrow(y),ncol=length(probs$p)+1)
fyc[status==2,1:length(probs$p)] <- t(apply(y[status==2,],1,dens.norm,
                                            param.cont,NULL))
#the function
p.post.found(found,status,probs,fyc)



