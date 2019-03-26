library(taxa)


### Name: taxon_rank
### Title: Taxon rank class
### Aliases: taxon_rank

### ** Examples

taxon_rank("species")
taxon_rank("genus")
taxon_rank("kingdom")

(x <- taxon_rank(
  "species",
  database_list$ncbi
))
x$rank
x$database

# a null taxon_name object
taxon_name(NULL)



