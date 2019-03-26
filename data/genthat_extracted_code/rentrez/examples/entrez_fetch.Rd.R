library(rentrez)


### Name: entrez_fetch
### Title: Download data from NCBI databases
### Aliases: entrez_fetch

### ** Examples

## Not run: 
##D katipo <- "Latrodectus katipo[Organism]"
##D katipo_search <- entrez_search(db="nuccore", term=katipo)
##D kaitpo_seqs <- entrez_fetch(db="nuccore", id=katipo_search$ids, rettype="fasta")
##D #xml
##D kaitpo_seqs <- entrez_fetch(db="nuccore", id=katipo_search$ids, rettype="native")
## End(Not run)



