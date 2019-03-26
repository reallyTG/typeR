library(groupedstats)


### Name: grouped_wilcox
### Title: Function to run two-sample Wilcoxon tests on multiple variables
###   across multiple grouping variables.
### Aliases: grouped_wilcox

### ** Examples


# only with one grouping variable
groupedstats::grouped_wilcox(
  data = dplyr::filter(.data = ggplot2::diamonds, color == "E" | color == "J"),
  dep.vars = depth:table,
  indep.vars = color,
  grouping.vars = clarity,
  paired = FALSE
)



