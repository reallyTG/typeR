library(samplingVarEst)


### Name: Est.Mean.NHT
### Title: The Narain-Horvitz-Thompson estimator for a mean
### Aliases: Est.Mean.NHT
### Keywords: point estimation mean

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                     #Defines the variable of interest y2
Est.Mean.NHT(y1[s==1], pik.U[s==1], N)      #The NHT estimator for y1
Est.Mean.NHT(y2[s==1], pik.U[s==1], N)      #The NHT estimator for y2



