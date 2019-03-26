library(evolqg)


### Name: PCAsimilarity
### Title: Compare matrices using PCA similarity factor
### Aliases: PCAsimilarity PCAsimilarity.default PCAsimilarity.list
###   PCAsimilarity.mcmc_sample
### Keywords: Krzanowski PCA matrixcomparison matrixcorrelation

### ** Examples

c1 <- RandomMatrix(10)
c2 <- RandomMatrix(10)
PCAsimilarity(c1, c2)

m.list <- RandomMatrix(10, 3)
PCAsimilarity(m.list)

PCAsimilarity(m.list, c1)



