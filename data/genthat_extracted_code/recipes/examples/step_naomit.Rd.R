library(recipes)


### Name: step_naomit
### Title: Remove observations with missing values
### Aliases: step_naomit tidy.step_naomit

### ** Examples


recipe(Ozone ~ ., data = airquality) %>%
  step_naomit(Solar.R) %>%
  prep(airquality, verbose = FALSE, retain = TRUE) %>%
  juice()




