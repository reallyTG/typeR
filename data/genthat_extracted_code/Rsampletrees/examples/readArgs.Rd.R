library(Rsampletrees)


### Name: readArgs
### Title: Read arguments for a sampletrees run from a settings file
### Aliases: readArgs

### ** Examples

filename=paste(path.package("Rsampletrees"),"/extdata/example_g_pars",sep="")
runpars=readArgs(filename, check=FALSE)
runname=paste(path.package("Rsampletrees"),"extdata",runpars$RunName, sep="/")
runpars=changeArgs(runpars, RunName=runname)
print.pars(runpars)



