library(Rsampletrees)


### Name: newArgs
### Title: Create or modify a sampletrees settings object
### Aliases: newArgs changeArgs changeArgs.pars

### ** Examples

runpars=newArgs(DataFile="sequences_Theta8_Rho8.txt", DataType="h", 
		LocationFile="locations_Theta8_Rho8.txt",RunName="Test-h",FocalPoint=10000)
runpars=changeArgs(runpars, Seed=1938474, WeightFile="weights-h.txt")



