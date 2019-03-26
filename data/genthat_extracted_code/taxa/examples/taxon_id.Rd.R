library(taxa)


### Name: taxon_id
### Title: Taxon ID class
### Aliases: taxon_id

### ** Examples

(x <- taxon_id(12345))
x$id
x$database

(x <- taxon_id(
  12345,
  database_list$ncbi
))
x$id
x$database

# a null taxon_name object
taxon_name(NULL)



