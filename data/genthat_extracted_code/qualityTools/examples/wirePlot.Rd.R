library(qualityTools)


### Name: wirePlot
### Title: 3D Plot
### Aliases: wirePlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

#create a response surface design and assign random data to response y
fdo = rsmDesign(k = 3, blocks = 2)
response(fdo) = data.frame(y = rnorm(nrow(fdo)))

par(mfrow = c(3,2))

#I - display linear fit
wirePlot(A,B,y, data = fdo, form = "linear")

#II - display full fit (i.e. effect, interactions and quadratic effects
wirePlot(A,B,y, data = fdo, form = "full")

#III - display a fit specified before
fits(fdo) = lm(y ~ B + I(A^2) , data = fdo)
wirePlot(A,B,y, data = fdo, form = "fit")

#IV - display a fit given directly
wirePlot(A,B,y, data = fdo, form = "y ~ A*B + I(A^2)")

#V - display a fit using a different colorRamp
wirePlot(A,B,y, data = fdo, form = "full", col = 2)

#V - display a fit using a self defined colorRamp
myColour = colorRampPalette(c("green", "gray","blue"))
wirePlot(A,B,y, data = fdo, form = "full", col = myColour)





