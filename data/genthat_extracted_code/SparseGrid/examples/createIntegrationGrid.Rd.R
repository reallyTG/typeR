library(SparseGrid)


### Name: createIntegrationGrid
### Title: Create integration grid with the least number of nodes, either
###   using a sparse grid or a product rule grid.
### Aliases: createIntegrationGrid
### Keywords: distribution multivariate

### ** Examples

# load library
library('SparseGrid')

# create integration grid
int.grid <- createIntegrationGrid( 'GQU', dimension=3, k=5 )



