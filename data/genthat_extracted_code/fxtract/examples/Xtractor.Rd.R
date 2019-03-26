library(fxtract)


### Name: Xtractor
### Title: R6 Object for Feature Extraction.
### Aliases: Xtractor

### ** Examples

# one feature function
dir = tempdir()
xtractor = Xtractor$new("xtractor", file.dir = dir)
xtractor$add_data(iris, group_by = "Species")
xtractor$ids
fun = function(data) {
  c(mean_sepal_length = mean(data$Sepal.Length))
}
xtractor$add_feature(fun)
xtractor$features
xtractor$calc_features()
xtractor$results
xtractor$status
xtractor

# failing function on only one ID
fun2 = function(data) {
  if ("setosa" %in% data$Species) stop("my error")
  c(sd_sepal_length = sd(data$Sepal.Length))
}
xtractor$add_feature(fun2)
xtractor$calc_features()
xtractor$results
xtractor$error_messages
xtractor

# remove feature function
xtractor$remove_feature("fun2")
xtractor$results
xtractor

# remove ID
xtractor$remove_data("setosa")
xtractor$results
xtractor$ids
xtractor

# get datasets and functions
fun3 = xtractor$get_feature("fun")
df = xtractor$get_data()
dplyr_wrapper(data = df, group_by = "Species", fun = fun3)




