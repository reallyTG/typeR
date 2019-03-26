library(samplingVarEst)


### Name: VE.HT.Mean.NHT
### Title: The Horvitz-Thompson variance estimator for the
###   Narain-Horvitz-Thompson point estimator for a mean
### Aliases: VE.HT.Mean.NHT
### Keywords: variance estimation mean

### ** Examples

data(oaxaca)                                  #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$SURFAC05) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sSURFAC                      #Defines the sample to be used
N      <- dim(oaxaca)[1]                      #Defines the population size
y1     <- oaxaca$POP10                        #Defines the variable of interest y1
y2     <- oaxaca$HOMES10                      #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])            #Approx. 2nd order incl. probs. from s
#Computes the variance estimation of the NHT point estimator for y1
VE.HT.Mean.NHT(y1[s==1], pik.U[s==1], pikl.s, N)
#Computes the variance estimation of the NHT point estimator for y2
VE.HT.Mean.NHT(y2[s==1], pik.U[s==1], pikl.s, N)



