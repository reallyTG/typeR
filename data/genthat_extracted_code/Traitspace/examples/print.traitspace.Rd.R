library(Traitspace)


### Name: print.traitspace
### Title: prints an object of class "traitspace". This function prints out
###   the summary of the results of the Traitspace of the TraitspaceMod
###   functions. See details.
### Aliases: print.traitspace

### ** Examples

data(spdata)
species<-spdata$species  #species column
trt<-cbind(spdata$t1,spdata$t2) #two traits
env<-spdata$env     #one env gradient
site<-spdata$site   #site information
result1<-Traitspace(species, trt, env, site)
print(result1)
result1



