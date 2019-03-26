library(taxa)


### Name: taxon
### Title: Taxon class
### Aliases: taxon

### ** Examples

(x <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
))
x$name
x$rank
x$id

# a null taxon object
taxon(NULL)
## with all NULL objects from the other classes
taxon(
  name = taxon_name(NULL),
  rank = taxon_rank(NULL),
  id = taxon_id(NULL)
)



