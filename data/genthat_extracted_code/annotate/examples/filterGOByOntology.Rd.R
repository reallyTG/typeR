library(annotate)


### Name: filterGOByOntology
### Title: Filter GO terms by a specified GO ontology
### Aliases: filterGOByOntology
### Keywords: manip

### ** Examples

haveGO <- suppressWarnings(require("GO.db"))
if (haveGO) {
    ids <- c("GO:0001838", "GO:0001839")
    stopifnot(all(filterGOByOntology(ids, "BP")))
    stopifnot(!any(filterGOByOntology(ids, "MF")))
} else cat("Sorry, this example requires the GO package\n")




