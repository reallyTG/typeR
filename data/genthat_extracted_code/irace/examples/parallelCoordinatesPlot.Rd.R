library(irace)


### Name: parallelCoordinatesPlot
### Title: parallelCoordinatesPlot
### Aliases: parallelCoordinatesPlot

### ** Examples

## No test: 
 ## To use data obtained by irace
 # First, load the data produced by irace.
 irace.logfile <- file.path(system.file(package="irace"), "exdata", "irace-acotsp.Rdata")
 load(irace.logfile)
 attach(iraceResults)
 parallelCoordinatesPlot(allConfigurations, parameters, hierarchy = FALSE)
## End(No test)




