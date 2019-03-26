library(qualityTools)


### Name: snPlot
### Title: Signal-to-Noise-Ratio Plots
### Aliases: snPlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

tdo = taguchiDesign("L9_3",replicates=3)
response(tdo) = rnorm(27)
snPlot(tdo, points = TRUE, col = 2, pch = 16, lty = 3)



