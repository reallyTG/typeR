library(vegetarian)


### Name: similarity
### Title: Similarity Summary Table
### Aliases: similarity

### ** Examples

data(simesants)
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
similarity(rbind(hemlock,hardwood))
similarity(hemlock,abundances2=hardwood)
similarity(hemlock,abundances2=hardwood,boot=TRUE)
similarity(hemlock,abundances2=hardwood,q=2,boot=TRUE,boot.arg=list(num.iter=200))



