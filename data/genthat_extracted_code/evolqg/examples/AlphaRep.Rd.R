library(evolqg)


### Name: AlphaRep
### Title: Alpha Repetability
### Aliases: AlphaRep
### Keywords: repeatatability

### ** Examples

#For single matrices
cor.matrix <- RandomMatrix(10)
AlphaRep(cor.matrix, 10)
AlphaRep(cor.matrix, 100)
#For many matrices
mat.list <- RandomMatrix(10, 100)
sample.sizes <- floor(runif(100, 20, 50))
unlist(Map(AlphaRep, mat.list, sample.sizes))



