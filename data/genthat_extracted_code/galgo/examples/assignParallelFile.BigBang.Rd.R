library(galgo)


### Name: assignParallelFile.BigBang
### Title: Assigns a different saveFile value for parallelization
### Aliases: assignParallelFile.BigBang BigBang.assignParallelFile
###   assignParallelFile.BigBang assignParallelFile,BigBang-method
###   assignParallelFile
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D 
##D 	#Initial process:
##D 	#load data and configure initial objects, run once
##D 	library(galgo)
##D 	bb <- configBB.varSel(..., saveFile="bb.parallel.Rdata", ...)
##D 	saveObject(bb)
##D 	#
##D 
##D 	#Parallel process:
##D 	#run as many process as you want
##D 	library(galgo)
##D 	loadObject("bb.parallel.Rdata")
##D 	assignParallelFile(bb)
##D 	blast(bb)
##D 	#
##D 
##D 
##D 	#Analysis Process:
##D 	library(galgo)
##D 	loadObject("bb.parallel.Rdata")
##D 	loadParallelFiles(bb)
##D 	#
##D 	
## End(Not run)
 


