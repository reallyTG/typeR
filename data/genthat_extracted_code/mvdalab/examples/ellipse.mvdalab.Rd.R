library(mvdalab)


### Name: ellipse.mvdalab
### Title: Ellipses, Data Ellipses, and Confidence Ellipses
### Aliases: ellipse.mvdalab

### ** Examples

data(iris)
ellipse.mvdalab(iris[, 1:2], plot.points = FALSE)
ellipse.mvdalab(iris[, 1:2], center = colMeans(iris[, 1:2]), plot.points = TRUE)



