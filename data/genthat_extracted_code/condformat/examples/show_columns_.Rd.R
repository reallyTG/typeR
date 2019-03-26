library(condformat)


### Name: show_columns_
### Title: Show columns (deprecated)
### Aliases: show_columns_

### ** Examples


data(iris)
x <- head(iris)
# Use standard evaluation (columns as strings):
condformat(x) +
  show_columns_(.dots = c("Sepal.Length", "Species"), col_names = c("Sepal Length", "Species"))



