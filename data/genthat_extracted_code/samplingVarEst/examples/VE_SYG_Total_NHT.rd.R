library(samplingVarEst)


### Name: VE.SYG.Total.NHT
### Title: The Sen-Yates-Grundy variance estimator for the
###   Narain-Horvitz-Thompson point estimator for a total
### Aliases: VE.SYG.Total.NHT
### Keywords: variance estimation total

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$HOMES10                     #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the NHT point estimator for y1
VE.SYG.Total.NHT(y1[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the NHT point estimator for y2
VE.SYG.Total.NHT(y2[s==1], pik.U[s==1], pikl.s)



