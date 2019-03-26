library(recipes)


### Name: step_holiday
### Title: Holiday Feature Generator
### Aliases: step_holiday tidy.step_holiday
### Keywords: datagen

### ** Examples

library(lubridate)

examples <- data.frame(someday = ymd("2000-12-20") + days(0:40))
holiday_rec <- recipe(~ someday, examples) %>%
   step_holiday(all_predictors())

holiday_rec <- prep(holiday_rec, training = examples)
holiday_values <- bake(holiday_rec, new_data = examples)
holiday_values



