library(shinystan)


### Name: drop_parameters
### Title: Drop parameters from a 'shinystan' object
### Aliases: drop_parameters

### ** Examples

# Using example shinystan object 'eight_schools'
print(eight_schools@param_names)

# Remove the scalar parameters mu and tau
sso <- drop_parameters(eight_schools, pars = c("mu", "tau"))
print(sso@param_names)

# Remove all elements of the parameter vector theta
sso <- drop_parameters(sso, pars = "theta")
print(sso@param_names)




