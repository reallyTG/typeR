library(RJSplot)


### Name: scatterplot_rjs
### Title: Produce and interactive Scatter plot (XY plot).
### Aliases: scatterplot_rjs

### ** Examples

## Create an interactive Scatter plot in the folder "ScatterPlot" of your local machine
## Live examples on http://rjsplot.net

# Scatter plot creation
scatterplot_rjs(iris$Sepal.Width, iris$Sepal.Length,
                abline.x = c(3.4,3.8), abline.y = c(5.8,7),
                col = iris$Species, pch = as.numeric(iris$Species), id = iris$Species,
                xlab = "Sepal Width (cm)", ylab = "Sepal Length (cm)")



