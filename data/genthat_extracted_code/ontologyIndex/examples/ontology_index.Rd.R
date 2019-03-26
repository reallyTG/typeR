library(ontologyIndex)


### Name: ontology_index
### Title: Create 'ontology_index' object from vectors and lists of term
###   properties
### Aliases: ontology_index

### ** Examples

animal_superclasses <- list(animal=character(0), mammal="animal", cat="mammal", fish="animal")
animal_ontology <- ontology_index(parents=animal_superclasses)
unclass(animal_ontology)



