library(groupedstats)


### Name: grouped_aov
### Title: Function to run analysis of variance (aov) across multiple
###   grouping variables.
### Aliases: grouped_aov

### ** Examples


# uses dataset included in the groupedstats package
library(groupedstats)

groupedstats::grouped_aov(
  formula = rating ~ belief * outcome * question,
  data = intent_morality,
  grouping.vars = item,
  effsize = "eta"
)



