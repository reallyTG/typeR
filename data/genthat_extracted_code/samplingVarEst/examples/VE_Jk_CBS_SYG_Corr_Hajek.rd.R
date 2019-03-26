library(samplingVarEst)


### Name: VE.Jk.CBS.SYG.Corr.Hajek
### Title: The Campbell-Berger-Skinner unequal probability jackknife
###   variance estimator for the estimator of a correlation coefficient
###   using the Hajek point estimator (Sen-Yates-Grundy form)
### Aliases: VE.Jk.CBS.SYG.Corr.Hajek
### Keywords: variance estimation correlation coefficient

### ** Examples

data(oaxaca)                                 #Loads the Oaxaca municipalities dataset
pik.U  <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s      <- oaxaca$sHOMES00                    #Defines the sample to be used
y1     <- oaxaca$POP10                       #Defines the variable of interest y1
y2     <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x      <- oaxaca$HOMES10                     #Defines the variable of interest x
#This approximation is only suitable for large-entropy sampling designs
pikl.s <- Pkl.Hajek.s(pik.U[s==1])           #Approx. 2nd order incl. probs. from s
#Computes the var. est. of the corr. coeff. point estimator using y1
VE.Jk.CBS.SYG.Corr.Hajek(y1[s==1], x[s==1], pik.U[s==1], pikl.s)
#Computes the var. est. of the corr. coeff. point estimator using y2
VE.Jk.CBS.SYG.Corr.Hajek(y2[s==1], x[s==1], pik.U[s==1], pikl.s)



