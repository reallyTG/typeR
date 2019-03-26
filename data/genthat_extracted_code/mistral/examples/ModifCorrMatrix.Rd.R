library(mistral)


### Name: ModifCorrMatrix
### Title: Modification of a correlation matrix to use in UtoX
### Aliases: ModifCorrMatrix

### ** Examples
 
Dim <- 2
input.Rho    <- matrix( c(1.0, 0.5,
                          0.5, 1.0),nrow=Dim)
input.R0     <- ModifCorrMatrix(input.Rho)
print(input.R0)



