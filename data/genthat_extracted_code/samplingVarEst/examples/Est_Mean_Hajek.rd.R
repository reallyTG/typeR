library(samplingVarEst)


### Name: Est.Mean.Hajek
### Title: The Hajek estimator for a mean
### Aliases: Est.Mean.Hajek
### Keywords: point estimation mean

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the variable of interest y1
y2    <- oaxaca$HOMES10                     #Defines the variable of interest y2
Est.Mean.Hajek(y1[s==1], pik.U[s==1])       #Computes the Hajek est. for y1
Est.Mean.Hajek(y2[s==1], pik.U[s==1])       #Computes the Hajek est. for y2



