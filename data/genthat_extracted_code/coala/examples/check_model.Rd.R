library(coala)


### Name: check_model
### Title: Check which simulator can simulate a model
### Aliases: check_model

### ** Examples

model <- coal_model(10, 1) +
  feat_mutation(5, fixed = TRUE)
check_model(model)



