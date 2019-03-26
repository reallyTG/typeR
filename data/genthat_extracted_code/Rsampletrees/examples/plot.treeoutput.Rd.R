library(Rsampletrees)


### Name: plot.treeoutput
### Title: Plot selected output of a sampletrees run
### Aliases: plot.treeoutput

### ** Examples

#\dontrun{
require(ape)
mrca.age=function(tree)
{
	return(coalescent.intervals(tree)$total.depth)
}

#system.file("Examples/example_g_pars", package="Rsampletrees")
filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")
runpars=readArgs(filename, check=FALSE)

# Must change the path so that the output can be found
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName,sep="/")
runpars=changeArgs(runpars, RunName=runname)

# Read in the output
results=readOutput(argob=runpars)

# Plot the output
plot(results)
plot(results, layoutmat=matrix(c(1,1,2,3),byrow=TRUE,nrow=2))
plot(results, oneperpage=TRUE, asktoplot=TRUE)

# Add a tree statistic
results=addTreeStat(results, myfunc=mrca.age, funcname="Time.to.MRCA")
plot(results)

#}



