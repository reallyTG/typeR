library(evclust)


### Name: create_MLCL
### Title: Random generation of Must-Link and Cannot-Link constraints
### Aliases: create_MLCL

### ** Examples

y<-sample(3,100,replace=TRUE)
const<-create_MLCL(y,nbConst=10)
const$ML
const$CL




