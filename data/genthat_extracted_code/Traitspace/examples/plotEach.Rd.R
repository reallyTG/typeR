library(Traitspace)


### Name: plotEach
### Title: Plot traitspace results one by one
### Aliases: plotEach

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information
result1<-Traitspace(species, trt, env, site)
plotEach(result1)



