library(samplingVarEst)


### Name: VE.Jk.EB.SW2.RegCoI.Hajek
### Title: The self-weighted two-stage sampling Escobar-Berger (2013)
###   jackknife variance estimator for the estimator of the intercept
###   regression coefficient using the Hajek point estimator
### Aliases: VE.Jk.EB.SW2.RegCoI.Hajek
### Keywords: variance estimation regression coefficient

### ** Examples

data(oaxaca)                          #Loads the Oaxaca municipalities dataset
s         <- oaxaca$sSW_10_3          #Defines the sample to be used
SampData  <- oaxaca[s==1, ]           #Defines the sample dataset
nII       <- 3                        #Defines the 2nd stage fixed sample size
CluLab.s  <- SampData$IDDISTRI        #Defines the clusters' labels
CluSize.s <- SampData$SIZEDIST        #Defines the clusters' sizes
piIi.s    <- (10 * CluSize.s / 570)   #Reconstructs clusters' 1st order incl. probs.
pik.s     <- piIi.s * (nII/CluSize.s) #Reconstructs elements' 1st order incl. probs.
y1.s      <- SampData$POP10           #Defines the variable y1
y2.s      <- SampData$POPMAL10        #Defines the variable y2
x.s       <- SampData$HOMES10         #Defines the variable x
#Computes the var. est. of the intercept reg. coeff. point estimator using y1
VE.Jk.EB.SW2.RegCoI.Hajek(y1.s, x.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)
#Computes the var. est. of the intercept reg. coeff. point estimator using y2
VE.Jk.EB.SW2.RegCoI.Hajek(y2.s, x.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)



