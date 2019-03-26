library(healthcareai)


### Name: step_date_hcai
### Title: Date and Time Feature Generator
### Aliases: step_date_hcai tidy.step_date_hcai

### ** Examples

library(lubridate)
library(recipes)

examples <- data.frame(Dan = ymd("2002-03-04") + days(1:10),
                       Stefan = ymd("2006-01-13") + days(1:10))
date_rec <- recipe(~ Dan + Stefan, examples) %>%
  step_date_hcai(all_predictors())

date_rec <- prep(date_rec, training = examples)

date_values <- bake(date_rec, new_data = examples)
date_values

# changing `feature_type` to `categories`
date_rec <-
  recipe(~ Dan + Stefan, examples) %>%
  step_date_hcai(all_predictors(), feature_type = "categories")

date_rec <- prep(date_rec, training = examples)

date_values <- bake(date_rec, new_data = examples)
date_values



