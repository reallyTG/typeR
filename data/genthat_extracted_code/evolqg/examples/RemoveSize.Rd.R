library(evolqg)


### Name: RemoveSize
### Title: Remove Size Variation
### Aliases: RemoveSize
### Keywords: size

### ** Examples

cov.matrix <- RandomMatrix(10, 1, 1, 10)
no.size.cov.matrix <- RemoveSize(cov.matrix)
eigen(cov.matrix)
eigen(no.size.cov.matrix)



