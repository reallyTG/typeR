library(vegetarian)


### Name: Rel.homog
### Title: Relative Homogeneity
### Aliases: Rel.homog

### ** Examples

data(simesants)
Rel.homog(simesants[1:2,-1])
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
Rel.homog(abundances=hemlock,abundances2=hardwood)
Rel.homog(simesants[1:2,-1], boot=TRUE)



