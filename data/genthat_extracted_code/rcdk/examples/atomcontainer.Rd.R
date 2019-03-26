library(rcdk)


### Name: Molecule
### Title: Operations on molecules
### Aliases: get.exact.mass get.natural.mass is.neutral
###   convert.implicit.to.explicit
### Keywords: programming

### ** Examples

  m <- parse.smiles('c1ccccc1')[[1]]

  ## Need to configure the molecule
  do.aromaticity(m)
  do.typing(m)
  do.isotopes(m)

  get.exact.mass(m)
  get.natural.mass(m)

  convert.implicit.to.explicit(m)
  get.natural.mass(m) 
  do.isotopes(m) # Configure isotopes of newly added hydrogens
  get.exact.mass(m)

  is.neutral(m)



