library(edarf)


### Name: plot_prox
### Title: Plot principle components of the proximity matrix
### Aliases: plot_prox

### ** Examples

library(randomForest)

fit = randomForest(hp ~ ., mtcars, proximity = TRUE)
prox = extract_proximity(fit)
pca = prcomp(prox, scale = TRUE)
plot_prox(pca, labels = row.names(mtcars))

fit = randomForest(Species ~ ., iris, proximity = TRUE)
prox = extract_proximity(fit)
pca = prcomp(prox, scale = TRUE)
plot_prox(pca, color = iris$Species, color_label = "Species", size = 2)



