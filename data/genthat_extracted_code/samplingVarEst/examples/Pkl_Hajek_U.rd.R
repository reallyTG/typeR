library(samplingVarEst)


### Name: Pkl.Hajek.U
### Title: The Hajek approximation for the 2nd order (joint) inclusion
###   probabilities (population based)
### Aliases: Pkl.Hajek.U
### Keywords: inclusion probabilities

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
#(This approximation is only suitable for large-entropy sampling designs)
pikl.U <- Pkl.Hajek.U(pik.U)                 #Approximates 2nd order incl. probs. from U
#First 5 rows/cols of (population based) 2nd order incl. probs. matrix
pikl.U[1:5,1:5]



