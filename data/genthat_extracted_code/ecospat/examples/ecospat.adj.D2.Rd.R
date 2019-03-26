library(ecospat)


### Name: ecospat.adj.D2.glm
### Title: Calculate An Adjusted D2
### Aliases: ecospat.adj.D2.glm

### ** Examples


data(ecospat.testData)
glm.obj<-glm(Achillea_millefolium~ddeg+mind+srad+slp+topo, 
family = binomial, data=ecospat.testData)

ecospat.adj.D2.glm(glm.obj)




