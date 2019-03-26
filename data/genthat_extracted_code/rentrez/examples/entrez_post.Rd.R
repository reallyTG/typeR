library(rentrez)


### Name: entrez_post
### Title: Post IDs to Eutils for later use
### Aliases: entrez_post

### ** Examples

## Not run: 
##D   
##D so_many_snails <- entrez_search(db="nuccore", 
##D                       "Gastropoda[Organism] AND COI[Gene]", retmax=200)
##D upload <- entrez_post(db="nuccore", id=so_many_snails$ids)
##D first <- entrez_fetch(db="nuccore", rettype="fasta", web_history=upload,
##D                       retmax=10)
##D second <- entrez_fetch(db="nuccore", file_format="fasta", web_history=upload,
##D                        retstart=10, retmax=10)
## End(Not run)



