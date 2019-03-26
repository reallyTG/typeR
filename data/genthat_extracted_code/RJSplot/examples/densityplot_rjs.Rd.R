library(RJSplot)


### Name: densityplot_rjs
### Title: Draw an interactive density plot.
### Aliases: densityplot_rjs

### ** Examples

## Creates a density plot in the folder "DensityPlot" of your local machine
## Live examples on http://rjsplot.net

## Generate test input data
data <- data.frame(Uni05 = (1:100)/21, Norm = rnorm(100), `5T` = rt(100, df = 5),
Gam2 = rgamma(100, shape = 2))

# Create the density plot
densityplot_rjs(data, "x", "y")



