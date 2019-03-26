library(Claddis)


### Name: MakeMorphMatrix
### Title: Creates a morphological data file from a matrix
### Aliases: MakeMorphMatrix

### ** Examples


# Create random 10-by-50 matrix:
CharacterTaxonMatrix <- matrix(sample(c("0", "1", "0&1", NA, ""),
  500, replace = TRUE), nrow = 10, dimnames =
  list(apply(matrix(sample(LETTERS, 40,
  replace = TRUE), nrow = 10), 1, paste,
  collapse = ""), c()))

# Reformat for use elsewhere in Claddis:
MakeMorphMatrix(CharacterTaxonMatrix)




