library(annotate)


### Name: getGOTerm
### Title: Functions to Access GO data.
### Aliases: getGOTerm getGOParents getGOChildren getGOOntology
### Keywords: manip

### ** Examples

 library("GO.db")

 sG <- sample(keys(GO.db, "GOID"), 8)

 gT <- getGOTerm(sG)
 gP <- getGOParents(sG)
 gC <- getGOChildren(sG)
 gcat <- getGOOntology(sG)




