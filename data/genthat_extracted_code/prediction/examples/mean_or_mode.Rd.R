library(prediction)


### Name: mean_or_mode
### Title: Class-dependent variable aggregation
### Aliases: mean_or_mode mean_or_mode.default mean_or_mode.numeric
###   mean_or_mode.data.frame median_or_mode median_or_mode.default
###   median_or_mode.numeric median_or_mode.data.frame

### ** Examples

require("datasets")
# mean for numerics
mean_or_mode(iris)
mean_or_mode(iris[["Sepal.Length"]])
mean_or_mode(iris[["Species"]])

# median for numerics
median_or_mode(iris)




