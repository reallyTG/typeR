library(samplingVarEst)


### Name: Est.Total.Hajek
### Title: The Hajek estimator for a total
### Aliases: Est.Total.Hajek
### Keywords: point estimation total

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
N     <- dim(oaxaca)[1]                     #Defines the population size
y1    <- oaxaca$POP10                       #Defines the variable y1
y2    <- oaxaca$HOMES10                     #Defines the variable y2
Est.Total.Hajek(y1[s==1], pik.U[s==1], N)   #The Hajek estimator for y1
Est.Total.Hajek(y2[s==1], pik.U[s==1], N)   #The Hajek estimator for y2



