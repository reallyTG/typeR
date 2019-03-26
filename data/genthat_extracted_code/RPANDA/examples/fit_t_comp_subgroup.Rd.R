library(RPANDA)


### Name: fit_t_comp_subgroup
### Title: Fits models of trait evolution incorporating competitive
###   interactions, restricting competition to occur only between members
###   of a subgroup
### Aliases: fit_t_comp_subgroup

### ** Examples



## No test: 

data(BGB.examples)


Canidae.phylo<-BGB.examples$Canidae.phylo
dummy.group<-c(rep("B",3),rep("A",12),rep("B",2),rep("A",6),rep("B",5),rep("A",6))
names(dummy.group)<-Canidae.phylo$tip.label


Canidae.simmap<-make.simmap(Canidae.phylo,dummy.group)

set.seed(123)
Canidae.data<-rnorm(length(Canidae.phylo$tip.label))
names(Canidae.data)<-Canidae.phylo$tip.label
Canidae.A<-Canidae.data[which(dummy.group=="A")]

fitA<-fit_t_comp_subgroup(full.phylo=Canidae.phylo,ana.events=BGB.examples$Canidae.ana.events, 
clado.events=BGB.examples$Canidae.clado.events,stratified=FALSE,map=Canidae.simmap, 
data=Canidae.A,trim.class="A",model="DDexp")
	
## End(No test)




