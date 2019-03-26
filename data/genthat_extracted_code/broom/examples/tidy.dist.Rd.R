library(broom)


### Name: tidy.dist
### Title: Tidy a(n) dist object
### Aliases: tidy.dist

### ** Examples


iris_dist <- dist(t(iris[, 1:4]))
iris_dist

tidy(iris_dist)
tidy(iris_dist, upper = TRUE)
tidy(iris_dist, diagonal = TRUE)




