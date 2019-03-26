library(Rsampletrees)


### Name: addTrees
### Title: Read in trees and add them to the tree output object
### Aliases: addTrees

### ** Examples

#\dontrun{
# Read in the settings; Must change the RunName so that the example files can be found

#system.file("Examples/example_g_pars",package="Rsampletrees")
filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")
runpars=readArgs(filename, check=FALSE)
#paste(system.file(package="Rsampletrees"),runpars$RunName, sep="/")
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName,sep="/")
runpars=changeArgs(runpars, RunName=runname)

# 1. Read in all the trees; may be slow
results=readOutput(argobj=runpars)
results=addTrees(results)
length(results$rawdata$Trees)

# 2. Read in a selection of lines
results=readOutput(argobj=runpars)
results=addTrees(results, all=FALSE, lines=c(5,10,31))
length(results$rawdata$Trees)

# 3. Read in trees from lines 5 to 15
results=readOutput(argobj=runpars)
results=addTrees(results, all=FALSE, start=5, end=15)
length(results$rawdata$Trees)

# 4. Read in 20 trees, starting at line 10
results=readOutput(argobj=runpars)
results=addTrees(results, all=FALSE, start=10, nlines=20)
length(results$rawdata$Trees)
#}



