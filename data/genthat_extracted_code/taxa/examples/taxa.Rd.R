library(taxa)


### Name: taxa
### Title: A class for multiple taxon objects
### Aliases: taxa

### ** Examples

(a <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
))
taxa(a, a, a)

# a null set
x <- taxon(NULL)
taxa(x, x, x)

# combo non-null and null
taxa(a, x, a)



