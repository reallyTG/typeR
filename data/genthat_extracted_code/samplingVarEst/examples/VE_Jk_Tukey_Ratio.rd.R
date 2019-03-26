library(samplingVarEst)


### Name: VE.Jk.Tukey.Ratio
### Title: The Tukey (1958) jackknife variance estimator for the estimator
###   of a ratio
### Aliases: VE.Jk.Tukey.Ratio
### Keywords: variance estimation ratio

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the numerator variable y1
y2    <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x     <- oaxaca$HOMES10                     #Defines the denominator variable x
#Computes the var. est. of the ratio point estimator using y1
VE.Jk.Tukey.Ratio(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the var. est. of the ratio point estimator using y2
VE.Jk.Tukey.Ratio(y2[s==1], x[s==1], pik.U[s==1], N, FPC= FALSE)



