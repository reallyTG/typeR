library(caret)


### Name: featurePlot
### Title: Wrapper for Lattice Plotting of Predictor Variables
### Aliases: featurePlot
### Keywords: hplot

### ** Examples


x <- matrix(rnorm(50*5),ncol=5)
y <- factor(rep(c("A", "B"),  25))

trellis.par.set(theme = col.whitebg(), warn = FALSE)
featurePlot(x, y, "ellipse")
featurePlot(x, y, "strip", jitter = TRUE)
featurePlot(x, y, "box")
featurePlot(x, y, "pairs")




