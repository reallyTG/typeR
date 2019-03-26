library(evolqg)


### Name: CalcR2
### Title: Mean Squared Correlations
### Aliases: CalcR2
### Keywords: correlation integration

### ** Examples

cov.matrix <- RandomMatrix(10, 1, 1, 10)
# both of the following calls are equivalent, 
# CalcR2() converts covariance matrices to correlation matrices internally
CalcR2(cov.matrix)
CalcR2(cov2cor(cov.matrix))



