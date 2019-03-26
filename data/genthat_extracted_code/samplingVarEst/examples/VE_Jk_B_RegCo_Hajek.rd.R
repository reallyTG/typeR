library(samplingVarEst)


### Name: VE.Jk.B.RegCo.Hajek
### Title: The Berger (2007) unequal probability jackknife variance
###   estimator for the estimator of the regression coefficient using the
###   Hajek point estimator
### Aliases: VE.Jk.B.RegCo.Hajek
### Keywords: variance estimation regression coefficient

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x      <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the var. est. of the regression coeff. point estimator using y1
VE.Jk.B.RegCo.Hajek(y1[s==1], x[s==1], pik.U[s==1])
#Computes the var. est. of the regression coeff. point estimator using y2
VE.Jk.B.RegCo.Hajek(y2[s==1], x[s==1], pik.U[s==1])



