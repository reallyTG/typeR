library(RPANDA)


### Name: likelihood_subgroup_model
### Title: Likelihood of a dataset under models with biogeography fit to a
###   subgroup.
### Aliases: likelihood_subgroup_model

### ** Examples

data(BGB.examples)


Canidae.phylo<-BGB.examples$Canidae.phylo
dummy.group<-c(rep("B",3),rep("A",12),rep("B",2),rep("A",6),rep("B",5),rep("A",6))
names(dummy.group)<-Canidae.phylo$tip.label

## No test: 

Canidae.simmap<-make.simmap(Canidae.phylo, dummy.group)

set.seed(123)
Canidae.data<-rnorm(length(Canidae.phylo$tip.label))
names(Canidae.data)<-Canidae.phylo$tip.label
Canidae.A<-Canidae.data[which(dummy.group=="A")]
Canidae.geobyclass.object<-CreateGeobyClassObject(phylo=Canidae.phylo, 
	simmap=Canidae.simmap, trim.class="A", ana.events=BGB.examples$Canidae.ana.events, 
	clado.events=BGB.examples$Canidae.clado.events,stratified=FALSE, rnd=5)

par <- c(log(0.01),-0.0005)
maxN<-max(vapply(Canidae.geobyclass.object$geography.object$geography.object, 
	function(x)max(rowSums(x)),1))

lh <- -likelihood_subgroup_model(data=Canidae.A, phylo=Canidae.geobyclass.object$map, 
	geo.object=Canidae.geobyclass.object$geography.object, model="DDlin", par=par, 
	return.z0=FALSE, maxN=maxN)
	
	
## End(No test)




