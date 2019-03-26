library(NetworkRiskMeasures)


### Name: criticality
### Title: Criticality of the vertices
### Aliases: criticality

### ** Examples

# Creating example data
## Assets Matrix (bilateral exposures)
assets_matrix <- matrix(c(0, 10, 3, 1, 0, 2, 0, 3, 0), ncol = 3)
rownames(assets_matrix) <- colnames(assets_matrix) <- letters[1:3]

## Capital Buffer
buffer <- c(a = 2, b = 5, c = 2)

# Criticality
criticality(assets_matrix, buffer)




