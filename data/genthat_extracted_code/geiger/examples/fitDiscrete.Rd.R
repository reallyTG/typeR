library(geiger)


### Name: fitDiscrete
### Title: model fitting for discrete comparative data
### Aliases: fitDiscrete
### Keywords: arith models

### ** Examples

## match data and tree
tmp=get(data(geospiza))
td=treedata(tmp$phy, tmp$dat)
geo=list(phy=td$phy, dat=td$data)
gb=round(geo$dat[,5]) ## create discrete data
names(gb)=rownames(geo$dat)

tmp=fitDiscrete(geo$phy, gb, model="ER", control=list(niter=5), ncores=2) #-7.119792
## using the returned likelihood function
lik=tmp$lik
lik(0.3336772, root="obs") #-7.119792
lik(0.3336772, root="flat") #-8.125354
lik(0.3336772, root="given", root.p=rep(1/3,3)) #-8.125354
lik(0.3336772, root="given", root.p=c(0, 1, 0)) #-7.074039
lik(c(0.3640363), root="given", root.p=rep(1,3)) #-7.020569 & comparable to ape:::ace solution

## No test: 
# general model (ARD)
fitDiscrete(geo$phy, gb, model="ARD", ncores=1) #-6.064573

# user-specified rate classes
mm=rbind(c(NA, 0, 0), c(1, NA, 2), c(0, 2, NA))
fitDiscrete(geo$phy, gb, model=mm, ncores=1) #-7.037944

# symmetric-rates model
fitDiscrete(geo$phy, gb, model="SYM", ncores=1)#-6.822943
## End(No test) 



