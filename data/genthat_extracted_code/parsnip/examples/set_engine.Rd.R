library(parsnip)


### Name: set_engine
### Title: Declare a computational engine and specific arguments
### Aliases: set_engine

### ** Examples

# First, set general arguments using the standardized names
mod <-
  logistic_reg(mixture = 1/3) %>%
  # now say how you want to fit the model and another other options
  set_engine("glmnet", nlambda = 10)
translate(mod, engine = "glmnet")



