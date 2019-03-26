library(divDyn)


### Name: affinity
### Title: Calculate environmental affinities of taxa
### Aliases: affinity

### ** Examples

data(corals)
# omit values where no occurrence environment entry is present, or where unknown
  fossils<-subset(corals, stg!=95)
  fossilEnv<-subset(fossils, bath!="uk")
# calculate affinities
  aff<-affinity(fossilEnv, env="bath", tax="genus", bin="stg", alpha=1)




