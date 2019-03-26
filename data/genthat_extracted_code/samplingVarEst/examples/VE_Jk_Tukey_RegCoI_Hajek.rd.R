library(samplingVarEst)


### Name: VE.Jk.Tukey.RegCoI.Hajek
### Title: The Tukey (1958) jackknife variance estimator for the estimator
###   of the intercept regression coefficient using the Hajek point
###   estimator
### Aliases: VE.Jk.Tukey.RegCoI.Hajek
### Keywords: variance estimation regression coefficient

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the var. est. of the intercept reg. coeff. point estimator using y1
VE.Jk.Tukey.RegCoI.Hajek(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the var. est. of the intercept reg. coeff. point estimator using y2
VE.Jk.Tukey.RegCoI.Hajek(y2[s==1], x[s==1], pik.U[s==1], N, FPC= FALSE)



