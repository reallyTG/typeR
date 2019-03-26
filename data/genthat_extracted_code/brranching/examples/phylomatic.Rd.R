library(brranching)


### Name: phylomatic
### Title: Query Phylomatic for a phylogenetic tree.
### Aliases: phylomatic

### ** Examples

## Not run: 
##D # Input taxonomic names
##D taxa <- c("Poa annua", "Phlox diffusa", "Helianthus annuus")
##D tree <- phylomatic(taxa=taxa, get = 'POST')
##D plot(tree, no.margin=TRUE)
##D 
##D # Genus names
##D taxa <- c("Poa", "Phlox", "Helianthus")
##D tree <- phylomatic(taxa=taxa, storedtree='R20120829', get='POST')
##D plot(tree, no.margin=TRUE)
##D 
##D # Lots of names
##D taxa <- c("Poa annua", "Collomia grandiflora", "Lilium lankongense", "Phlox diffusa",
##D "Iteadaphne caudata", "Gagea sarmentosa", "Helianthus annuus")
##D tree <- phylomatic(taxa=taxa, get = 'POST')
##D plot(tree, no.margin=TRUE)
##D 
##D # Don't clean - clean=TRUE is default
##D (tree <- phylomatic(taxa=taxa, clean = FALSE))
##D ## with clean=FALSE, you can get non-splitting nodes, which you
##D ## need to collpase before plotting
##D library('ape')
##D plot(collapse.singles(tree), no.margin=TRUE)
##D 
##D # Output NeXML format
##D taxa <- c("Gonocarpus leptothecus", "Gonocarpus leptothecus", "Lilium lankongense")
##D out <- phylomatic(taxa=taxa, get = 'POST', outformat = "nexml")
##D cat(out)
##D 
##D # Lots of names, note that when you have enough names (number depends on length of individual
##D # names, so there's no per se rule), you will get an error when using `get='GET'`,
##D # when that happens use `get='POST'`
##D library("taxize")
##D spp <- names_list("species", 500)
##D # phylomatic(taxa = spp, get = "GET")
##D (out <- phylomatic(taxa = spp, get = "POST"))
##D plot(out)
##D 
##D # Pass in a tree from a URL on the web
##D spp <- c("Abies_nordmanniana", "Abies_bornmuelleriana", "Abies_cilicica", "Abies_cephalonica",
##D "Abies_numidica", "Abies_pinsapo", "Abies_alba")
##D url <- "http://datadryad.org/bitstream/handle/10255/dryad.8791/final_tree.tre?sequence=1"
##D phylomatic(taxa=spp, treeuri=url)
## End(Not run)



