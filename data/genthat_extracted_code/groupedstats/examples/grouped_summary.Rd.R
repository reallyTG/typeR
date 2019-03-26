library(groupedstats)


### Name: grouped_summary
### Title: Function to get descriptive statistics for multiple variables
###   for all grouping variable levels
### Aliases: grouped_summary

### ** Examples


# another possibility
groupedstats::grouped_summary(
  data = datasets::iris,
  grouping.vars = Species,
  measures = Sepal.Length:Petal.Width,
  measures.type = "numeric"
)

# if you have just one variable per argument, you need not use `c()`
groupedstats::grouped_summary(
  data = datasets::ToothGrowth,
  grouping.vars = supp,
  measures = len,
  measures.type = "numeric"
)



