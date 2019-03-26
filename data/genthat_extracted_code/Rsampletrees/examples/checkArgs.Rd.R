library(Rsampletrees)


### Name: checkArgs
### Title: Error checking for the arguments to sampletrees
### Aliases: checkArgs

### ** Examples


# Will produce error messages
runpars=newArgs()
runpars=checkArgs(runpars)

# Will not produce errors
#system.file("Examples/sequences_Theta8_Rho8.txt",package="Rsampletrees")
datname=paste(path.package("Rsampletrees"),"/extdata/sequences_Theta8_Rho8.txt",sep="")
#system.file("Examples/locations_Theta8_Rho8.txt",package="Rsampletrees")
locname=paste(path.package("Rsampletrees"),"/extdata/locations_Theta8_Rho8.txt",sep="")
#system.file("Examples/weights-h.txt", package="Rsampletrees")
weightname=paste(path.package("Rsampletrees"),"/extdata/weights-h.txt",sep="")
runpars=newArgs(DataFile=datname, DataType="h", WeightFile=weightname,
		LocationFile=locname,RunName="Test-h",FocalPoint=10000)
runpars=checkArgs(runpars)




