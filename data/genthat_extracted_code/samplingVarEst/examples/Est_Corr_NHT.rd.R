library(samplingVarEst)


### Name: Est.Corr.NHT
### Title: Estimator of a correlation coefficient using the
###   Narain-Horvitz-Thompson point estimator
### Aliases: Est.Corr.NHT
### Keywords: point estimation correlation coefficient

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$POPMAL10                    #Defines the variable of interest y2
x     <- oaxaca$HOMES10                     #Defines the variable of interest x
#Computes the correlation coefficient estimator for y1 and x
Est.Corr.NHT(y1[s==1], x[s==1], pik.U[s==1], N)
#Computes the correlation coefficient estimator for y2 and x
Est.Corr.NHT(y2[s==1], x[s==1], pik.U[s==1], N)



