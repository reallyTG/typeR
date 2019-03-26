library(RPANDA)


### Name: CreateGeoObject_BioGeoBEARS
### Title: Create biogeography object using a stochastic map from
###   BioGeoBEARS
### Aliases: CreateGeoObject_BioGeoBEARS

### ** Examples


data(BGB.examples)

## No test: 


##Example with a non-stratified tree

Canidae.geography.object<-CreateGeoObject_BioGeoBEARS(full.phylo=BGB.examples$Canidae.phylo,
ana.events=BGB.examples$Canidae.ana.events, clado.events=BGB.examples$Canidae.clado.events)

#on a subclade
Canidae.trimmed<-drop.tip(BGB.examples$Canidae.phylo 
							,BGB.examples$Canidae.phylo$tip.label[1:9])
							
Canidae.trimmed.geography.object<-CreateGeoObject_BioGeoBEARS(
full.phylo=BGB.examples$Canidae.phylo, trimmed.phylo=Canidae.trimmed, 
ana.events=BGB.examples$Canidae.ana.events, clado.events=BGB.examples$Canidae.clado.events)

##Example with a stratified tree

Ochotonidae.geography.object<-CreateGeoObject_BioGeoBEARS( 
full.phylo = BGB.examples$Ochotonidae.phylo, ana.events = BGB.examples$Ochotonidae.ana.events,
clado.events = BGB.examples$Ochotonidae.clado.events, stratified = TRUE)

#on a subclade
Ochotonidae.trimmed<-drop.tip(BGB.examples$Ochotonidae.phylo, 
BGB.examples$Ochotonidae.phylo$tip.label[1:9])
								
Ochotonidae.trimmed.geography.object<-CreateGeoObject_BioGeoBEARS(
full.phylo=BGB.examples$Ochotonidae.phylo, trimmed.phylo=Ochotonidae.trimmed, 
ana.events=BGB.examples$Ochotonidae.ana.events, 
clado.events=BGB.examples$Ochotonidae.clado.events, stratified=TRUE)

## End(No test)




