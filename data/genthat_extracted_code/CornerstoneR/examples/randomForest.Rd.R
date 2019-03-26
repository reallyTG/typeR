library(CornerstoneR)


### Name: randomForest
### Title: Random Forest
### Aliases: randomForest

### ** Examples

# Fit random forest to iris data:
res = randomForest(iris, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), "Species"
                   , brush = rep(FALSE, nrow(iris)), return.results = TRUE
                   )
# Show general statistics:
res$statistics



