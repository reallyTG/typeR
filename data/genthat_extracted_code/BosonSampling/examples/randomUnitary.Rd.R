library(BosonSampling)


### Name: randomUnitary
### Title: Random unitary
### Aliases: randomUnitary

### ** Examples

m <- 25 # size of matrix (m x m)
set.seed(7)
U <- randomUnitary(m)
#  
n <- 5 # First n columns
A <- U[,1:n]



