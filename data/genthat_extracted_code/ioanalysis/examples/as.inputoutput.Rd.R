library(ioanalysis)


### Name: as.inputoutput
### Title: Creating an Input-Output Object
### Aliases: as.inputoutput

### ** Examples

# In toy,FullIOTable it is a full matrix of characters: a pseudo worst case scenario
data(toy.FullIOTable)
Z <- matrix(as.numeric(toy.FullIOTable[3:12, 3:12]), ncol = 10)
f <- matrix(as.numeric(toy.FullIOTable[3:12, c(13:15, 17:19)]), nrow = dim(Z)[1])
E <- matrix(as.numeric(toy.FullIOTable[3:12, c(16, 20)]), nrow = 10)
X <- matrix(as.numeric(toy.FullIOTable[3:12, 21]), ncol = 1)
V <- matrix(as.numeric(toy.FullIOTable[13:15, 3:12]), ncol = 10)
M <- as.numeric(toy.FullIOTable[16, 3:12])
fV <- matrix(as.numeric(toy.FullIOTable[15:16, c(13:15,17:19)]), nrow = 2)

# Note toy.FullIOTable is a matrix of characters: non-numeric
toy.IO <- as.inputoutput(Z = Z, RS_label = toy.FullIOTable[3:12, 1:2],
                         f = f, f_label = toy.FullIOTable[1:2, c(13:15, 17:19)],
                         E = E, E_label = toy.FullIOTable[1:2, c(16, 20)],
                         X = X,
                         V = V, V_label = toy.FullIOTable[13:15, 2],
                         M = M, M_label = toy.FullIOTable[16,2],
                         fV = fV, fV_label = toy.FullIOTable[15:16, 2])

# Notice we do not need to supply the matrix of technical coefficients (A)



