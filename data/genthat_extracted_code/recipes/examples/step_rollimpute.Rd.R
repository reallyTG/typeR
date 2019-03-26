library(recipes)


### Name: step_rollimpute
### Title: Impute Numeric Data Using a Rolling Window Statistic
### Aliases: step_rollimpute tidy.step_rollimpute
### Keywords: datagen

### ** Examples

library(lubridate)

set.seed(145)
example_data <-
  data.frame(
    day = ymd("2012-06-07") + days(1:12),
    x1 = round(runif(12), 2),
    x2 = round(runif(12), 2),
    x3 = round(runif(12), 2)
  )
example_data$x1[c(1, 5, 6)] <- NA
example_data$x2[c(1:4, 10)] <- NA

library(recipes)
seven_pt <- recipe(~ . , data = example_data) %>%
  update_role(day, new_role = "time_index") %>%
  step_rollimpute(all_predictors(), window = 7) %>%
  prep(training = example_data, retain = TRUE)

juice(seven_pt)



