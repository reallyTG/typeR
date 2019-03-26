library(paleotree)


### Name: parentChild2taxonTree
### Title: Create a Taxonomy-Based Phylogeny ('Taxon Tree') from a Table of
###   Parent-Child Taxon Relationships
### Aliases: parentChild2taxonTree

### ** Examples


#let's create a small, really cheesy example
pokexample <- rbind(cbind("Squirtadae",c("Squirtle","Blastoise","Wartortle")),
	c("Shelloidea","Lapras"),c("Shelloidea","Squirtadae"),
	c("Pokezooa","Shelloidea"),c("Pokezooa","Parasect"),
	c("Rodentapokemorpha","Linoone"),c("Rodentapokemorpha","Sandshrew"),
	c("Rodentapokemorpha","Pikachu"),c("Hirsutamona","Ursaring"),
	c("Hirsutamona","Rodentapokemorpha"),c("Pokezooa","Hirsutamona"))

#Default: tipSet = 'nonParents'
pokeTree <- parentChild2taxonTree(pokexample, tipSet = "nonParents")
plot(pokeTree);nodelabels(pokeTree$node.label)

#Get ALL taxa as tips with tipSet = 'all'
pokeTree <- parentChild2taxonTree(pokexample, tipSet = "all")
plot(pokeTree);nodelabels(pokeTree$node.label)


## Not run: 
##D 
##D # let's try a dataset where not all the taxon relationships lead to a common root
##D 
##D pokexample_bad <- rbind(cbind("Squirtadae",c("Squirtle","Blastoise","Wartortle")),
##D 	c("Shelloidea","Lapras"),c("Shelloidea","Squirtadae"),
##D 	c("Pokezooa","Shelloidea"),c("Pokezooa","Parasect"),
##D 	c("Rodentapokemorpha","Linoone"),c("Rodentapokemorpha","Sandshrew"),
##D 	c("Rodentapokemorpha","Pikachu"),c("Hirsutamona","Ursaring"),
##D 	c("Hirsutamona","Rodentapokemorpha"),c("Pokezooa","Hirsutamona"),
##D 	c("Umbrarcheota","Gengar"))
##D 
##D #this should return an error, as Gengar doesn't share common root
##D pokeTree <- parentChild2taxonTree(pokexample_bad)
##D 
##D 
##D # another example, where a taxon is listed as both parent and child
##D pokexample_bad2 <- rbind(cbind("Squirtadae",c("Squirtle","Blastoise","Wartortle")),
##D 	c("Shelloidea",c("Lapras","Squirtadae","Shelloidea")),
##D 	c("Pokezooa","Shelloidea"),c("Pokezooa","Parasect"),
##D 	c("Rodentapokemorpha","Linoone"),c("Rodentapokemorpha","Sandshrew"),
##D 	c("Rodentapokemorpha","Pikachu"),c("Hirsutamona","Ursaring"),
##D 	c("Hirsutamona","Rodentapokemorpha"),c("Pokezooa","Hirsutamona"),
##D 	c("Umbrarcheota","Gengar"))
##D 
##D #this should return an error, as Shelloidea is its own parent
##D pokeTree <- parentChild2taxonTree(pokexample_bad2)
##D 
## End(Not run)



# note that we should even be able to do this with ancestor-descendent pairs from
	 # simulated datasets from simFossilRecord, like so:
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
# need to reorder the columns so parents (ancestors) first, then children 
parentChild2taxonTree(taxa[,2:1])
# now note that it issues a warning that the input wasn't type character
   # and it will be coerced to be such




