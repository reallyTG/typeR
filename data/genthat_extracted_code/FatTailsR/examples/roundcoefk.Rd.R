library(FatTailsR)


### Name: roundcoefk
### Title: Round Coefk
### Aliases: roundcoefk

### ** Examples

    

mat   <- matrix(runif(35), ncol=7) 
coefk <- mat[1,]

roundcoefk(coefk, dgts = 2, parnames = FALSE)
roundcoefk(coefk, dgts = 15)
roundcoefk(mat, dgts = 15)





