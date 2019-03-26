library(CircStats)


### Name: rose.diag
### Title: Rose Diagram
### Aliases: rose.diag
### Keywords: hplot

### ** Examples

# Generate uniform data and create several rose diagrams.  
# Some optional parameters may be needed to optimize plots.
data <- runif(50, 0, 2*pi)
rose.diag(data, bins = 18, main = 'Uniform Data')
rose.diag(data, bins = 18, main = 'Stacked Points', pts=TRUE)
# Generate von Mises data and create several rose diagrams.
data <- rvm(25, 0, 5)
rose.diag(data, bins=18, pts=TRUE) # Points fall out of bounds.
rose.diag(data, bins=36, prop=1.5, pts=TRUE, shrink=1.5)
# Adjust optional parameters to fit all points on plot.



