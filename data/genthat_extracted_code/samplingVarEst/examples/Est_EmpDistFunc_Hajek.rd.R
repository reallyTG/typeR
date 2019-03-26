library(samplingVarEst)


### Name: Est.EmpDistFunc.Hajek
### Title: The Hajek estimator for the empirical cumulative distribution
###   function
### Aliases: Est.EmpDistFunc.Hajek
### Keywords: point estimation empirical cumulative distribution function

### ** Examples

data(oaxaca)                                      #Loads Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)       #Reconstructs the inclusion probs.
s     <- oaxaca$sHOMES00                          #Defines the sample to be used
y1    <- oaxaca$POP10                             #Defines the variable of interest y1
Est.EmpDistFunc.Hajek(y1[s==1], pik.U[s==1], 950) #Hajek est. of ECDF for y1 at t=950



