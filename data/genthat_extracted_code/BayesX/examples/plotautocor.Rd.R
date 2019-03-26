library(BayesX)


### Name: plotautocor
### Title: Computing and Plotting Autocorrelation Functions
### Aliases: plotautocor
### Keywords: hplot

### ** Examples

res <- read.table(system.file("examples/nonparametric_f_x_pspline_sample.raw", 
                              package="BayesX"), header=TRUE)
plotautocor(res)
plotautocor(res, lag.max=50)



