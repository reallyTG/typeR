library(irace)


### Name: parameterFrequency
### Title: Plot of histogram of parameter values
### Aliases: parameterFrequency

### ** Examples

## No test: 
 ## To use data obtained by irace

 # First, load the data produced by irace.
 irace.logfile <- file.path(system.file(package="irace"), "exdata", "irace-acotsp.Rdata")
 load(irace.logfile)
 attach(iraceResults)
 parameterFrequency(allConfigurations, parameters)
## End(No test)




