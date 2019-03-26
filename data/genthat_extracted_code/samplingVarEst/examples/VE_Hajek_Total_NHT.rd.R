library(samplingVarEst)


### Name: VE.Hajek.Total.NHT
### Title: The Hajek variance estimator for the Narain-Horvitz-Thompson
###   point estimator for a total
### Aliases: VE.Hajek.Total.NHT
### Keywords: variance estimation total

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$SURFAC05) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sSURFAC                      #Defines the sample to be used
y1    <- oaxaca$POP10                        #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                      #Defines the variable of interest y2
#Computes the (approximate) var. est. of the NHT point est. from y1
VE.Hajek.Total.NHT(y1[s==1], pik.U[s==1])
#Computes the (approximate) var. est. of the NHT point est. from y2
VE.Hajek.Total.NHT(y2[s==1], pik.U[s==1])



