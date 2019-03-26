library(traits)


### Name: ncbi_byname
### Title: Retrieve gene sequences from NCBI by taxon name and gene names.
### Aliases: ncbi_byname

### ** Examples

## Not run: 
##D # A single species
##D ncbi_byname(taxa="Acipenser brevirostrum")
##D 
##D # Many species
##D species <- c("Colletes similis","Halictus ligatus","Perdita californica")
##D ncbi_byname(taxa=species, gene = c("coi", "co1"), seqrange = "1:2000")
## End(Not run)



