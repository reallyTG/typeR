library(vegetarian)


### Name: M.homog
### Title: MacArthur's Homogeneity Measure
### Aliases: M.homog

### ** Examples

data(simesants)
M.homog(simesants[1:2,-1])
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
M.homog(abundances=hemlock,abundances2=hardwood)
M.homog(simesants[1:2,-1], q=2,std=TRUE,boot=TRUE)




