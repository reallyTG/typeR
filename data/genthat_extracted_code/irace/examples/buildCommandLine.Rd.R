library(irace)


### Name: buildCommandLine
### Title: Generate a command-line representation of a configuration
### Aliases: buildCommandLine

### ** Examples

switches <- c("--switch1 ", "--switch2 ")
values <- c("value_1", "value_2")
buildCommandLine (values, switches)
## Build a command-line from the results produced by a previous run of irace.
# First, load the data produced by irace.
irace.logfile <- file.path(system.file(package="irace"),
                           "exdata", "irace-acotsp.Rdata")
load(irace.logfile)
attach(iraceResults)
apply(allConfigurations[1:10, unlist(parameters$names)], 1, buildCommandLine,
      unlist(parameters$switches))




