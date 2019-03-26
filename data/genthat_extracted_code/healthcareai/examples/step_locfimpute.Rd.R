library(healthcareai)


### Name: step_locfimpute
### Title: Last Observation Carried Forward Imputation
### Aliases: step_locfimpute tidy.step_locfimpute

### ** Examples

library(recipes)

prepped <-
  recipe(formula = "~.", pima_diabetes) %>%
  step_locfimpute(weight_class, insulin, skinfold, diastolic_bp) %>%
  prep()

bake(prepped, new_data = pima_diabetes)



