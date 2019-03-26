library(samplingVarEst)


### Name: Pkl.Hajek.s
### Title: The Hajek approximation for the 2nd order (joint) inclusion
###   probabilities (sample based)
### Aliases: Pkl.Hajek.s
### Keywords: inclusion probabilities

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#First 5 rows/cols of (sample based) 2nd order incl. probs. matrix
pikl.s[1:5,1:5]



