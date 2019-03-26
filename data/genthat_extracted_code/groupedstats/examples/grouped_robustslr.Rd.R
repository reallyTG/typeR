library(groupedstats)


### Name: grouped_robustslr
### Title: Function to run robust simple linear regression (slr) on
###   multiple variables across multiple grouping variables.
### Aliases: grouped_robustslr

### ** Examples


# in case of just one grouping variable
groupedstats::grouped_robustslr(
  data = iris,
  dep.vars = c(Sepal.Length, Petal.Length),
  indep.vars = c(Sepal.Width, Petal.Width),
  grouping.vars = Species
)



