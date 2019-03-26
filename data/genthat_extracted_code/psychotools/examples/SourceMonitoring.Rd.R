library(psychotools)


### Name: SourceMonitoring
### Title: Performance in a Source-Monitoring Experiment
### Aliases: SourceMonitoring
### Keywords: datasets

### ** Examples

data("SourceMonitoring", package = "psychotools")
xtabs(~ gender + I(age >= 30) + sources, SourceMonitoring)



