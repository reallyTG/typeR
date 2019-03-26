library(qualityTools)


### Name: effectPlot
### Title: Main Effect Plots
### Aliases: effectPlot
### Keywords: Design of Experiments Six Sigma design methods

### ** Examples

#effectPlot for a 2^k factorial design
fdo = facDesign(k = 3)
#set response with generic response function
response(fdo) = rnorm(8)  
effectPlot(fdo)

#effectPlot for a taguchiDesign
tdo = taguchiDesign("L9_3")
response(tdo) = rnorm(9)
effectPlot(tdo, points = TRUE, col = 2, pch = 16, lty = 3)




