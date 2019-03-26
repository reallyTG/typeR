library(samplingVarEst)


### Name: VE.Jk.EB.SW2.Mean.Hajek
### Title: The self-weighted two-stage sampling Escobar-Berger (2013)
###   jackknife variance estimator for the Hajek (1971) estimator of a mean
### Aliases: VE.Jk.EB.SW2.Mean.Hajek
### Keywords: variance estimation mean

### ** Examples

data(oaxaca)                          #Loads the Oaxaca municipalities dataset
s         <- oaxaca$sSW_10_3          #Defines the sample to be used
SampData  <- oaxaca[s==1, ]           #Defines the sample dataset
nII       <- 3                        #Defines the 2nd stage fixed sample size
CluLab.s  <- SampData$IDDISTRI        #Defines the clusters' labels
CluSize.s <- SampData$SIZEDIST        #Defines the clusters' sizes
piIi.s    <- (10 * CluSize.s / 570)   #Reconstructs clusters' 1st order incl. probs.
pik.s     <- piIi.s * (nII/CluSize.s) #Reconstructs elements' 1st order incl. probs.
y1.s      <- SampData$POP10           #Defines the variable of interest y1
y2.s      <- SampData$POPMAL10        #Defines the variable of interest y2
#Computes the var. est. of the Hajek mean point estimator using y1
VE.Jk.EB.SW2.Mean.Hajek(y1.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)
#Computes the var. est. of the Hajek mean point estimator using y2
VE.Jk.EB.SW2.Mean.Hajek(y2.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s)



