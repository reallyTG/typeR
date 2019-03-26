library(samplingVarEst)


### Name: VE.Hajek.Mean.NHT
### Title: The Hajek variance estimator for the Narain-Horvitz-Thompson
###   point estimator for a mean
### Aliases: VE.Hajek.Mean.NHT
### Keywords: variance estimation mean

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                     #Defines the variable of interest y2
#Computes the (approximate) var. est. of the NHT point est. for y1
VE.Hajek.Mean.NHT(y1[s==1], pik.U[s==1], N)
#Computes the (approximate) var. est. of the NHT point est. for y2
VE.Hajek.Mean.NHT(y2[s==1], pik.U[s==1], N)



