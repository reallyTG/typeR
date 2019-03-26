library(groupedstats)


### Name: grouped_ttest
### Title: Function to run t-test on multiple variables across multiple
###   grouping variables.
### Aliases: grouped_ttest

### ** Examples


groupedstats::grouped_ttest(
  data = dplyr::filter(.data = ggplot2::diamonds, color == "E" | color == "J"),
  dep.vars = c(carat, price, depth),
  indep.vars = color,
  grouping.vars = clarity,
  paired = FALSE,
  var.equal = FALSE
)



