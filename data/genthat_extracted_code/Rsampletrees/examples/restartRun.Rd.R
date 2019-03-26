library(Rsampletrees)


### Name: restartRun
### Title: Set up a settings object for continuing a previous sampletrees
###   run
### Aliases: restartRun

### ** Examples

#\dontrun{

#system.file("Examples/example_h_pars",package="Rsampletrees")
filename=paste(path.package("Rsampletrees"),"/extdata/example_h_pars",sep="")
runpars=readArgs(filename, check=FALSE)

# Include path in run name so that function can find the necessary files
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName, sep="/")
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
runpars=changeArgs(runpars,RunName=runname)

newpars=restartRun("example-h-2.pars", oldargs=runpars, totalsamples=200000)

#}



