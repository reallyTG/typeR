library(annotate)


### Name: getOntology
### Title: Get GO terms for a specified ontology
### Aliases: getOntology
### Keywords: manip

### ** Examples

 library("hgu95av2.db")
 bb <- hgu95av2GO[["39613_at"]]
 getOntology(bb)
 sapply(bb, function(x) x$Ontology)



