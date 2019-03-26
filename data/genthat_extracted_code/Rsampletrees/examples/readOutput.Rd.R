library(Rsampletrees)


### Name: readOutput
### Title: Read in sampletrees output
### Aliases: readOutput

### ** Examples

#\dontrun{
#system.file("Examples/example_g_pars", package="Rsampletrees")
filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")
runpars=readArgs(filename, check=FALSE)

# Must change the path so that the output can be found
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName, sep="/")
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
runpars=changeArgs(runpars, RunName=runname)

# Read in the output
results=readOutput(argobj=runpars)

#}



