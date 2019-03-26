library(sperich)


### Name: species.richness.main
### Title: Main Function for species richness estimation
### Aliases: species.richness.main

### ** Examples

##load data
data(dataset.all.species)
data(dataset.landwater)
data(dataset.height)

##estimate species richness
species.richness.weighted <- species.richness.main(dataset.all.species, 	
	    dataset.landwater, dataset.height, distances=1:5, weight=0.5, 
	    resolution=1, narrow.endemic=FALSE, narrow.endemic.limit=5, 
	    upperbound=5, cross.validation=FALSE, fold=5, loocv.limit=10, 
	    create.image=FALSE, directory=getwd(), filename="species.richness.png", 
	    all.species=1:2, export=FALSE)



