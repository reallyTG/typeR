## ----echo=FALSE----------------------------------------------------------
library(ontologyIndex)

## ----eval=FALSE----------------------------------------------------------
#  ontology <- get_ontology(file)

## ----eval=FALSE----------------------------------------------------------
#  ontology <- get_ontology(file, propagate_relationships=c("is_a", "part_of"))

## ----eval=FALSE----------------------------------------------------------
#  get_relation_names("go.obo")

## ----eval=TRUE, echo=FALSE-----------------------------------------------
c("is_a", "regulates", "part_of", "has_part", "happens_during", "negatively_regulates", "positively_regulates", "occurs_in", "ends_during")

## ----eval=FALSE----------------------------------------------------------
#  ontology <- get_ontology(file, extract_tags="everything")

## ----eval=FALSE----------------------------------------------------------
#  ontology$property <- simplify2array(ontology$property)

## ----eval=FALSE----------------------------------------------------------
#  ontology$number_of_children <- sapply(ontology$children, length)

## ----eval=TRUE-----------------------------------------------------------
animal_superclasses <- list(animal=character(0), mammal="animal", cat="mammal", fish="animal")
animal_ontology <- ontology_index(parents=animal_superclasses)
unclass(animal_ontology)

