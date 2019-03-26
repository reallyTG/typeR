library(Rsampletrees)


### Name: merge.treeoutput
### Title: Merge the results from two runs of sampletrees
### Aliases: merge.treeoutput

### ** Examples

#\dontrun{
#system.file("Examples/example_h_pars",package="Rsampletrees")
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
filename=paste(path.package("Rsampletrees"),"/extdata/example_h_pars",sep="")
runpars=readArgs(filename, check=FALSE)
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName, sep="/")
runpars=changeArgs(runpars, RunName=runname)
results1=readOutput(argobj=runpars)

#system.file("Examples/example_h_2_pars",package="Rsampletrees")
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
filename=paste(path.package("Rsampletrees"),"/extdata/example_h_2_pars",sep="")
runpars=readArgs(filename, check=FALSE)
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName, sep="/")
runpars=changeArgs(runpars, RunName=runname)
results2=readOutput(argobj=runpars)
newresults=merge(x=results1, y=results2, runname="Merge2000")

#}



