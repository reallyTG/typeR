library(healthcareai)


### Name: interpret
### Title: Interpret a model via regularized coefficient estimates
### Aliases: interpret

### ** Examples

m <- machine_learn(pima_diabetes, patient_id, outcome = diabetes, models = "glm")
interpret(m)
interpret(m, .2)
interpret(m) %>%
  plot()



