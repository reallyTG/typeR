library(groupedstats)


### Name: lm_effsize_ci
### Title: Confidence intervals for partial eta-squared and omega-squared
###   for linear models.
### Aliases: lm_effsize_ci

### ** Examples

# model
set.seed(123)
mod <-
  stats::aov(
    formula = mpg ~ wt + qsec + Error(disp / am),
    data = mtcars
  )

# dataframe with effect size and confidence intervals
groupedstats::lm_effsize_ci(mod)



