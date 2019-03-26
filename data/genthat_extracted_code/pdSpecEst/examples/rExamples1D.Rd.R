library(pdSpecEst)


### Name: rExamples1D
### Title: Several example curves of HPD matrices
### Aliases: rExamples1D

### ** Examples

example <- rExamples1D(100, example = "bumps", return.ts = TRUE)
plot.ts(Re(example$ts), main = "3-d time series") # plot generated time series




