library(popbio)


### Name: matrix2
### Title: Square matrices
### Aliases: matrix2
### Keywords: methods

### ** Examples

#Centaurea corymbosa from Freville 2004
ceco<-c(0,0,5.905,0.368,0.639, 0.025, 0.001, 0.152, 0.051)
stages <- c("seedling", "vegetative", "flowering")
# shortcut for
#matrix(ceco, nrow=3, byrow=TRUE,  dimnames=list(stages,stages))
matrix2(ceco, stages)





