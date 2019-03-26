library(SciViews)


### Name: pcomp
### Title: Principal Components Analysis.
### Aliases: pcomp pcomp.formula pcomp.default print.pcomp summary.pcomp
###   print.summary.pcomp plot.pcomp screeplot.pcomp points.pcomp
###   lines.pcomp text.pcomp biplot.pcomp pairs.pcomp predict.pcomp
###   correlation.pcomp scores scores.pcomp
### Keywords: models

### ** Examples

# We will analyze mtcars without the Mercedes data (rows 8:14)
data(mtcars)
cars.pca <- pcomp(~ mpg + cyl + disp + hp + drat + wt + qsec, data = mtcars,
  subset = -(8:14))
cars.pca
summary(cars.pca)
screeplot(cars.pca)

# Loadings are extracted and plotted like this
(cars.ldg <- loadings(cars.pca))
plot(cars.pca, which = "loadings") # Equivalent to vectorplot(cars.ldg)

# Similarly, correlations of variables with PCs are extracted and plotted
(cars.cor <- Correlation(cars.pca))
plot(cars.pca, which = "correlations") # Equivalent to vectorplot(cars.cor)
# One can add supplementary variables on this graph
lines(Correlation(cars.pca,
  newvars = mtcars[-(8:14), c("vs", "am", "gear", "carb")]))

# Plot the scores
plot(cars.pca, which = "scores", cex = 0.8) # Similar to plot(scores(x)[, 1:2])
# Add supplementary individuals to this plot (labels), also points() or lines()
text(predict(cars.pca, newdata = mtcars[8:14, ]), col = "gray", cex = 0.8)

# Pairs plot for 3 PCs
iris.pca <- pcomp(iris[, -5])
pairs(iris.pca, col = (2:4)[iris$Species])



