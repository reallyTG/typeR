library(Rsampletrees)


### Name: addTreeStat
### Title: Add tree statistics to a treeoutput object
### Aliases: addTreeStat

### ** Examples

# A function that computes the time to MRCA of a tree using the ape package
require(ape)
mrca.age=function(tree)
{
	return(coalescent.intervals(tree)$total.depth)
}
#\dontrun{
 # Read in the settings; Must change the RunName so that the example files can be found
#system.file("Examples/example_g_pars",package="Rsampletrees")
 filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")
 runpars=readArgs(filename, check=FALSE)
 
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
 runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName,sep="/")
 runpars=changeArgs(runpars, RunName=runname)
 
 # Read in the output and add the summary statistic
 results=readOutput(argobj=runpars)
 results=addTreeStat(results, myfunc=mrca.age, funcname="Time.to.MRCA")
#}



