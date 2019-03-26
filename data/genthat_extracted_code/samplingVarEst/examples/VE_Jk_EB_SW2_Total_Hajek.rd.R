library(samplingVarEst)


### Name: VE.Jk.EB.SW2.Total.Hajek
### Title: The self-weighted two-stage sampling Escobar-Berger (2013)
###   jackknife variance estimator for the Hajek (1971) estimator of a
###   total
### Aliases: VE.Jk.EB.SW2.Total.Hajek
### Keywords: variance estimation total

### ** Examples

data(oaxaca)                          #Loads the Oaxaca municipalities dataset
s         <- oaxaca$sSW_10_3          #Defines the sample to be used
N         <- dim(oaxaca)[1]           #Defines the population size
SampData  <- oaxaca[s==1, ]           #Defines the sample dataset
nII       <- 3                        #Defines the 2nd stage fixed sample size
CluLab.s  <- SampData$IDDISTRI        #Defines the clusters' labels
CluSize.s <- SampData$SIZEDIST        #Defines the clusters' sizes
piIi.s    <- (10 * CluSize.s / 570)   #Reconstructs clusters' 1st order incl. probs.
pik.s     <- piIi.s * (nII/CluSize.s) #Reconstructs elements' 1st order incl. probs.
y1.s      <- SampData$POP10           #Defines the variable of interest y1
y2.s      <- SampData$POPMAL10        #Defines the variable of interest y2
#Computes the var. est. of the Hajek total point estimator using y1
VE.Jk.EB.SW2.Total.Hajek(y1.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s, N)
#Computes the var. est. of the Hajek total point estimator using y2
VE.Jk.EB.SW2.Total.Hajek(y2.s, pik.s, nII, piIi.s, CluLab.s, CluSize.s, N)



