library(RPANDA)


### Name: CreateGeobyClassObject
### Title: Create merged biogeography-by-class object
### Aliases: CreateGeobyClassObject

### ** Examples


data(BGB.examples)

## No test: 

Canidae.phylo<-BGB.examples$Canidae.phylo
dummy.group<-c(rep("B",3),rep("A",12),rep("B",2),rep("A",6),rep("B",5),rep("A",6))
names(dummy.group)<-Canidae.phylo$tip.label

Canidae.simmap<-make.simmap(Canidae.phylo,dummy.group)

#build GeobyClass object with "A" as the focal group

Canidae.geobyclass.object<-CreateGeobyClassObject(phylo=Canidae.phylo,simmap=Canidae.simmap, 
trim.class="A",ana.events=BGB.examples$Canidae.ana.events, 
clado.events=BGB.examples$Canidae.clado.events,stratified=FALSE, rnd=5)
	
plotSimmap(Canidae.geobyclass.object$map)
## End(No test)




