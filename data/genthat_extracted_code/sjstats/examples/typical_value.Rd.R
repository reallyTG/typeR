library(sjstats)


### Name: typical_value
### Title: Return the typical value of a vector
### Aliases: typical_value

### ** Examples

data(iris)
typical_value(iris$Sepal.Length)

library(purrr)
map(iris, ~ typical_value(.x))

# example from ?stats::weighted.mean
wt <- c(5,  5,  4,  1) / 15
x <- c(3.7, 3.3, 3.5, 2.8)

typical_value(x, fun = "weighted.mean")
typical_value(x, fun = "weighted.mean", weights = wt)

# for factors, return either reference level or mode value
set.seed(123)
x <- sample(iris$Species, size = 30, replace = TRUE)
typical_value(x)
typical_value(x, fun = "mode")

# for factors, use a named vector to apply other functions than "mode"
map(iris, ~ typical_value(.x, fun = c(n = "median", f = "mean")))





