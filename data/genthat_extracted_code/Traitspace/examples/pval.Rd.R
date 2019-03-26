library(Traitspace)


### Name: pval
### Title: Permutation test on distances
### Aliases: pval

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information
result1<-Traitspace(species, trt, env, site)
pval(result1)



