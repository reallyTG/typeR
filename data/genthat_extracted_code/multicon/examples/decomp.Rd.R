library(multicon)


### Name: decomp
### Title: Decomposition of Effects
### Aliases: decomp
### Keywords: Variance Decomposition Decomposition

### ** Examples

data(exsitu)
data(insitu)
  # Decomposition of the column and row effects of a single data matrix
decomp(exsitu)
  # Decomposition of the column and row effects of two data matrices including
  # the similarities (correlations) between the row, column, and unqiue effects. 
decomp(exsitu, insitu)



