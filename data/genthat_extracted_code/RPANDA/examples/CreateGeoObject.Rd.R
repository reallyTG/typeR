library(RPANDA)


### Name: CreateGeoObject
### Title: Create biogeography object
### Aliases: CreateGeoObject

### ** Examples


data(Anolis.data)
#Create a geography.object with a modified edge matrix
#First, specify which region each branch belonged to:
Anolis.regions<-c(rep("cuba",14),rep("hispaniola",17),"puerto_rico")
Anolis.map<-cbind(Anolis.data$phylo$edge,Anolis.regions)
CreateGeoObject(Anolis.data$phylo,map=Anolis.map)

#Create a geography.object with a make.simmap object
#First, specify which region each branch belonged to:
require(phytools)
geo<-c(rep("cuba",7),rep("hispaniola",9),"puerto_rico")
names(geo)<-Anolis.data$phylo$tip.label
stochastic.map<-make.simmap(Anolis.data$phylo,geo, model="ER", nsim=1)
CreateGeoObject(Anolis.data$phylo,map=stochastic.map)




