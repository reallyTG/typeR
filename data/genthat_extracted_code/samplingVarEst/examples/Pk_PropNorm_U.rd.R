library(samplingVarEst)


### Name: Pk.PropNorm.U
### Title: Inclusion probabilities proportional to a specified variable.
### Aliases: Pk.PropNorm.U
### Keywords: inclusion probabilities

### ** Examples

data(oaxaca) #Loads the Oaxaca municipalities dataset
             #Creates the normalised 1st order incl. probs. proportional
             #to the variable oaxaca$HOMES00 and with sample size 373
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
sum(pik.U)   #Shows the sum is equal to the sample size 373
any(pik.U>1) #Shows there isn't any probability greater than 1
any(pik.U<0) #Shows there isn't any probability less than 0



