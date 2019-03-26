library(vocaldia)


### Name: staticMatrix
### Title: staticMatrix Iterate until transition probabilities converge (or
###   give up).
### Aliases: staticMatrix

### ** Examples

data(vocdia)
x2 <- staticMatrix(vocmatrix$ttarray, digits=4, history=TRUE)
## original matrix
round(x2[[1]],3)
## stationary matrix (M^139)
round(x2[[length(x2)]],3)



