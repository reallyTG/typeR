library(phylobase)


### Name: MRCA
### Title: MRCA
### Aliases: MRCA MRCA,phylo4-method MRCA,phylo-method

### ** Examples

  data(geospiza)
  MRCA(geospiza, 1, 5)
  MRCA(geospiza, "fortis", 11)
  MRCA(geospiza, 2, 4, "fusca", 3)
  geo <- as(geospiza, "phylo")
  MRCA(geo, c(1,5))



