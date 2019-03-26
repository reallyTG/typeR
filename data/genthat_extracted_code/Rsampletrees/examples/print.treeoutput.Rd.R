library(Rsampletrees)


### Name: print.treeoutput
### Title: Nice display of a treeoutput object
### Aliases: print.treeoutput

### ** Examples

#\dontrun{
#system.file("Examples/example_g_pars",package="Rsampletrees")
filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")

runpars=readArgs(filename, check=FALSE)
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName,sep="/")
runpars=changeArgs(runpars, RunName=runname)
results=readOutput(argobj=runpars)

print(results)

#}



