library(groupedstats)


### Name: grouped_slr
### Title: Function to run simple linear regression (slr) on multiple
###   variables across multiple grouping variables.
### Aliases: grouped_slr grouped_simplelm

### ** Examples


# in case of just one grouping variable
groupedstats::grouped_slr(
  data = iris,
  dep.vars = c(Sepal.Length, Petal.Length),
  indep.vars = c(Sepal.Width, Petal.Width),
  grouping.vars = Species
)



