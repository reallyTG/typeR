library(Traitspace)


### Name: trueP
### Title: estimate observed matrix
### Aliases: trueP

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
data(spdata)
species<-spdata$species  #species column
site<-spdata$site   #site information

trueP(species, site)



