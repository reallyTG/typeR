library(RJSplot)


### Name: scatter3d_rjs
### Title: Produce and interactive 3D Scatter plot (XYZ plot).
### Aliases: scatter3d_rjs

### ** Examples

## Create an interactive 3D Scatter plot in the folder "ScatterPlot" of your local machine
## Live examples on http://rjsplot.net

# 3D Scatter plot creation
scatter3d_rjs(iris$Sepal.Width, iris$Sepal.Length, iris$Petal.Width, color = iris$Species,
              xlab = "Sepal Width (cm)", ylab = "Sepal Length (cm)", zlab = "Petal Width (cm)")



