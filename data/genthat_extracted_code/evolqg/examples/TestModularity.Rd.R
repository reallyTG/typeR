library(evolqg)


### Name: TestModularity
### Title: Test modularity hypothesis
### Aliases: TestModularity
### Keywords: mantel modularity

### ** Examples

cor.matrix <- RandomMatrix(10)
rand.hypots <- matrix(sample(c(1, 0), 30, replace=TRUE), 10, 3)
mod.test <- TestModularity(cor.matrix, rand.hypots)

cov.matrix <- RandomMatrix(10, 1, 1, 10)
cov.mod.test <- TestModularity(cov.matrix, rand.hypots, MHI = TRUE)
nosize.cov.mod.test <- TestModularity(RemoveSize(cov.matrix), rand.hypots, MHI = TRUE)



