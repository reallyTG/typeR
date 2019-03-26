library(assertive.models)


### Name: assert_has_terms
### Title: Does the input have terms?
### Aliases: assert_has_terms has_terms

### ** Examples

model <- lm(uptake ~ conc, datasets::CO2)
# this works because model$terms is not null
assert_has_terms(model)



