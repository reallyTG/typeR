library(brranching)


### Name: phylomatic_local
### Title: Use Phylomatic locally - ideal for large queries
### Aliases: phylomatic_local

### ** Examples

## Not run: 
##D library('ape')
##D 
##D # Input taxonomic names
##D taxa <- c("Poa annua", "Phlox diffusa", "Helianthus annuus")
##D (tree <- phylomatic_local(taxa))
##D plot(collapse.singles(tree), no.margin=TRUE)
##D 
##D taxa <- c("Poa annua", "Collomia grandiflora", "Lilium lankongense",
##D "Phlox diffusa", "Iteadaphne caudata", "Gagea sarmentosa",
##D "Helianthus annuus")
##D (tree <- phylomatic_local(taxa))
##D plot(collapse.singles(tree), no.margin=TRUE)
##D 
##D library("taxize")
##D spp <- names_list("species", 500)
##D length(spp)
##D (tree <- phylomatic_local(spp))
## End(Not run)



