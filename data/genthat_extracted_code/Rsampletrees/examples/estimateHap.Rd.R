library(Rsampletrees)


### Name: estimateHap
### Title: Estimate and write haplotype probabilities and initial values to
###   files
### Aliases: estimateHap

### ** Examples

#\dontrun{
#system.file("Examples/geno_Theta8_Rho8.txt",package="Rsampletrees")
#system.file("Examples/locations_Theta8_Rho8.txt",package="Rsampletrees")
#system.file("Examples/weights-g.txt",package="Rsampletrees")
datname=paste(path.package("Rsampletrees"),"/extdata/geno_Theta8_Rho8.txt",sep="")
locname=paste(path.package("Rsampletrees"),"/extdata/ocations_Theta8_Rho8.txt",sep="")
weightname=paste(path.package("Rsampletrees"),"/extdata/weights-g.txt",sep="")
runpars=newArgs(DataFile=datname, DataType="g", LocationFile=locname, WeightFile="weights-g.txt",
	    RunName="Test-g",FocalPoint=10000)

runpars=estimateHap(runpars,"EM-hapfreqs",InitialHaploFile="EM-initial.dat",
HaploListFile="EM-known_haplotypes")

#}



