library(samplingVarEst)


### Name: VE.Jk.B.Mean.Hajek
### Title: The Berger (2007) unequal probability jackknife variance
###   estimator for the Hajek estimator of a mean
### Aliases: VE.Jk.B.Mean.Hajek
### Keywords: variance estimation mean

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10                    #Defines the variable of interest y2
#Computes the var. est. of the Hajek mean point estimator using y1
VE.Jk.B.Mean.Hajek(y1[s==1], pik.U[s==1])
#Computes the var. est. of the Hajek mean point estimator using y2
VE.Jk.B.Mean.Hajek(y2[s==1], pik.U[s==1])



