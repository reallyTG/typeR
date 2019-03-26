library(BRugs)


### Name: BRugs
### Title: Introduction to BRugs
### Aliases: BRugs help.BRugs
### Keywords: interface documentation

### ** Examples

## No test: 
###    Step by step example:    ###
library("BRugs") # loading BRugs

## Prepare the example files in a temporary directory
exfiles <- dir(options()$OpenBUGSExamples, pattern="^Rats.*txt$", full.names=TRUE)
ok <- file.copy(exfiles, tempdir())

## Now setting the working directory to the temporary one:
oldwd <- setwd(tempdir())

## some usual steps (like clicking in WinBUGS):
modelCheck("Ratsmodel.txt")          # check model file
modelData("Ratsdata.txt")            # read data file
modelCompile(numChains=2)            # compile model with 2 chains
modelInits(rep("Ratsinits.txt", 2))  # read init data file
modelUpdate(1000)                    # burn in
samplesSet(c("alpha0", "alpha"))     # alpha0 and alpha should be monitored
modelUpdate(1000)                    # 1000 more iterations ....

samplesStats("*")                    # the summarized results

## some plots
samplesHistory("*", mfrow = c(4, 2)) # plot the chain,
samplesDensity("alpha")              # plot the densities,
samplesBgr("alpha[1:6]")             # plot the bgr statistics, and
samplesAutoC("alpha[1:6]", 1)        # plot autocorrelations of 1st chain

## switch back to the previous working directory:
setwd(oldwd)
## End(No test)
## Not run: 
##D # Getting more (online-)help:
##D if (is.R())
##D   help.BRugs()
## End(Not run)



