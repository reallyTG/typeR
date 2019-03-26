library(Rpdb)


### Name: vectorialOperations
### Title: Basic Vectorial Operations
### Aliases: dotProd rotVect vectNorm vectProd vectorialOperations
### Keywords: manip

### ** Examples

Vx <- c(3,0,0)
vectNorm(Vx)
Vx <- Vx/vectNorm(Vx)
Vy <- c(0,1,0)
Vz <- vectProd(Vx, Vy)
print(Vz)




