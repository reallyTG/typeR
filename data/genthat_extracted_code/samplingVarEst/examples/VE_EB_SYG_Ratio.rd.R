library(samplingVarEst)


### Name: VE.EB.SYG.Ratio
### Title: The Escobar-Berger unequal probability replicate variance
###   estimator for the estimator of a ratio (Sen-Yates-Grundy form)
### Aliases: VE.EB.SYG.Ratio
### Keywords: variance estimation ratio

### ** Examples

data(oaxaca)                                  #Loads the Oaxaca municipalities dataset
pik.U   <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s       <- oaxaca$sHOMES00                    #Defines the sample to be used
y1      <- oaxaca$POP10                       #Defines the numerator variable y1
y2      <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x       <- oaxaca$HOMES10                     #Defines the denominator variable x
Alpha.s <- rep(2, times=373)                  #Defines the vector with Alpha values
#This approximation is only suitable for large-entropy sampling designs
pikl.s  <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the ratio point estimator using y1
VE.EB.SYG.Ratio(y1[s==1], x[s==1], pik.U[s==1], pikl.s) #Using default VecAlpha.s
#Computes the var. est. of the ratio point estimator using y2
VE.EB.SYG.Ratio(y2[s==1], x[s==1], pik.U[s==1], pikl.s, Alpha.s)



