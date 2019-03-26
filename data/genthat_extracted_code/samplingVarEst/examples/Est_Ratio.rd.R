library(samplingVarEst)


### Name: Est.Ratio
### Title: Estimator of a ratio
### Aliases: Est.Ratio
### Keywords: point estimation ratio

### ** Examples

data(oaxaca)                                #Loads the Oaxaca municipalities dataset
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00) #Reconstructs the 1st order incl. probs.
s     <- oaxaca$sHOMES00                    #Defines the sample to be used
y1    <- oaxaca$POP10                       #Defines the numerator variable y1
y2    <- oaxaca$POPMAL10                    #Defines the numerator variable y2
x     <- oaxaca$HOMES10                     #Defines the denominator variable x
Est.Ratio(y1[s==1], x[s==1], pik.U[s==1])   #Ratio estimator for y1 and x
Est.Ratio(y2[s==1], x[s==1], pik.U[s==1])   #Ratio estimator for y2 and x



