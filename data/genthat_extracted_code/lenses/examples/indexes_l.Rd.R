library(lenses)


### Name: indexes_l
### Title: Construct a lens into a subset of an object
### Aliases: indexes_l indexes

### ** Examples

x <- 1:10
view(x, indexes_l(3:5))
set(x, indexes_l(c(1,10)), NA)
head(view(iris, indexes_l(c("Sepal.Length", "Species"))))



