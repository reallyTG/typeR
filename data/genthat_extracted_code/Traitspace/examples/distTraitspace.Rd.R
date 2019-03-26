library(Traitspace)


### Name: distTraitspace
### Title: Calculate the distances
### Aliases: distTraitspace

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information
result1<-Traitspace(species, trt, env, site)
distTraitspace(result1)



