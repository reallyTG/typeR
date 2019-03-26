library(Traitspace)


### Name: TraitspaceMod
### Title: Modified Traitspace Model
### Aliases: TraitspaceMod

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information
result2<-TraitspaceMod(species, trt, env, site)
result2



