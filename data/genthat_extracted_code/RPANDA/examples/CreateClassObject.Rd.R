library(RPANDA)


### Name: CreateClassObject
### Title: Create class object
### Aliases: CreateClassObject

### ** Examples


data(Anolis.data)

#Create a make.simmap object
require(phytools)
geo<-c(rep("cuba",7),rep("hispaniola",9),"puerto_rico")
names(geo)<-Anolis.data$phylo$tip.label
stochastic.map<-make.simmap(Anolis.data$phylo,geo, model="ER", nsim=1)
CreateClassObject(stochastic.map)




