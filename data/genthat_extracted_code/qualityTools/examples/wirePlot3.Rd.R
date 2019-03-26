library(qualityTools)


### Name: wirePlot3
### Title: function to create a ternary plot (3D wire plot) for an object
###   of class mixDesign
### Aliases: wirePlot3
### Keywords: Design of Experiments Six Sigma

### ** Examples

#yarn elongation example p.564 Response Surface Methodology
mdo = mixDesign(3,2, center = FALSE, axial = FALSE, randomize = FALSE, 
                replicates  = c(1,1,2,3))
names(mdo) = c("polyethylene", "polystyrene", "polypropylene")
units(mdo) = "percent"
elongation = c(11.0, 12.4, 15.0, 14.8, 16.1, 17.7, 16.4, 16.6, 8.8, 10.0, 10.0,
               9.7, 11.8, 16.8, 16.0)
response(mdo) = elongation

dev.new(14,14); par(mfrow = c(2,2))
wirePlot3(A, B, C, elongation, data = mdo, form = "linear")
wirePlot3(A, B, C, elongation, data = mdo, form = "quadratic", col = 2)
wirePlot3(A, B, C, elongation, data = mdo, 
          form = "elongation ~ I(A^2) - B:A + I(C^2)", col = 3)
wirePlot3(A, B, C, elongation, data = mdo, form = "quadratic", 
          col = colorRampPalette(c("yellow", "white", "red")))



