library(BRugs)


### Name: BRugsFit
### Title: BRugs' meta function
### Aliases: BRugsFit
### Keywords: interface

### ** Examples

## No test: 
## Prepare the example files in a temporary directory
exfiles <- dir(options()$OpenBUGSExamples, pattern="^Rats.*txt$", full.names=TRUE)
ok <- file.copy(exfiles, tempdir())
BRugsFit(data = "Ratsdata.txt", inits = "Ratsinits.txt",
    para = c("alpha", "beta"), modelFile = "Ratsmodel.txt",
    numChains = 1,
    working.directory = tempdir())
## End(No test)



