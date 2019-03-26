library(paleotree)


### Name: taxonTable2taxonTree
### Title: Create a Taxonomy-Based Phylogeny ('Taxon Tree') from a
###   Hierarchical Table of Taxonomy Memberships
### Aliases: taxonTable2taxonTree

### ** Examples


#let's create a small, really cheesy example
pokeTable <- rbind(cbind("Pokezooa","Shelloidea","Squirtadae",
		c("Squirtle","Blastoise","Wartortle")),
	c("Pokezooa","Shelloidea","","Lapras"),
	c("Pokezooa","","","Parasect"),
	cbind("Pokezooa","Hirsutamona","Rodentapokemorpha",
		c("Linoone","Sandshrew","Pikachu")),
	c("Pokezooa","Hirsutamona",NA,"Ursaring"))

pokeTree <- taxonTable2taxonTree(pokeTable)
plot(pokeTree);nodelabels(pokeTree$node.label)




