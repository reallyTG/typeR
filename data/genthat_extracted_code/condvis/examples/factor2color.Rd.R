library(condvis)


### Name: factor2color
### Title: Assign colours to factor vector
### Aliases: factor2color

### ** Examples

plot(iris[, c("Petal.Length", "Petal.Width")], pch = 21,
  bg = factor2color(iris$Species))
legend("topleft", legend = levels(iris$Species),
  fill = factor2color(as.factor(levels(iris$Species))))




