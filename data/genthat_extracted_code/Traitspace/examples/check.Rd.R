library(Traitspace)


### Name: check
### Title: Checks the input data
### Aliases: check

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information

check(species, trt, env, site)



