library(samplingVarEst)


### Name: Est.Total.NHT
### Title: The Narain-Horvitz-Thompson estimator for a total
### Aliases: Est.Total.NHT
### Keywords: point estimation total

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                     #Defines the variable of interest y2
Est.Total.NHT(y1[s==1], pik.U[s==1])        #Computes the NHT estimator for y1
Est.Total.NHT(y2[s==1], pik.U[s==1])        #Computes the NHT estimator for y2



