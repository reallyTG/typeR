library(samplingVarEst)


### Name: VE.Jk.CBS.SYG.Total.Hajek
### Title: The Campbell-Berger-Skinner unequal probability jackknife
###   variance estimator for the Hajek (1971) estimator of a total
###   (Sen-Yates-Grundy form)
### Aliases: VE.Jk.CBS.SYG.Total.Hajek
### Keywords: variance estimation total

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
N      <- dim(oaxaca)[1]                     #Defines the population size
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10                    #Defines the variable of interest y2
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the Hajek total point estimator using y1
VE.Jk.CBS.SYG.Total.Hajek(y1[s==1], pik.U[s==1], pikl.s, N)
#Computes the var. est. of the Hajek total point estimator using y2
VE.Jk.CBS.SYG.Total.Hajek(y2[s==1], pik.U[s==1], pikl.s, N)



