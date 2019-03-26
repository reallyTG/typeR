library(samplingVarEst)


### Name: VE.EB.HT.Mean.Hajek
### Title: The Escobar-Berger unequal probability replicate variance
###   estimator for the Hajek (1971) estimator of a mean (Horvitz-Thompson
###   form)
### Aliases: VE.EB.HT.Mean.Hajek
### Keywords: variance estimation mean

### ** Examples

data(oaxaca)                                  #Loads the Oaxaca municipalities dataset
pik.U   <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s       <- oaxaca$sHOMES00                    #Defines the sample to be used
y1      <- oaxaca$POP10                       #Defines the variable y1
y2      <- oaxaca$POPMAL10                    #Defines the variable y2
Alpha.s <- rep(2, times=373)                  #Defines the vector with Alpha values
#This approximation is only suitable for large-entropy sampling designs
pikl.s  <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the Hajek mean point estimator using y1
VE.EB.HT.Mean.Hajek(y1[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the Hajek mean point estimator using y2
VE.EB.HT.Mean.Hajek(y2[s==1], pik.U[s==1], pikl.s, Alpha.s)



