library(assertive.models)


### Name: assert_is_empty_model
### Title: Is the input the empty model?
### Aliases: assert_is_empty_model assert_is_non_empty_model is_empty_model
###   is_non_empty_model

### ** Examples

# empty models have no intercept and no factors
an_empty_model <- lm(uptake ~ 0, CO2)
is_empty_model(an_empty_model)

a_model_with_an_intercept <- lm(uptake ~ 1, CO2)
a_model_with_factors <- lm(uptake ~ conc * Type, CO2)
is_non_empty_model(a_model_with_an_intercept)
is_non_empty_model(a_model_with_factors)

assertive.base::dont_stop(assert_is_empty_model(a_model_with_factors))



