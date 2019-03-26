library(shinystan)


### Name: generate_quantity
### Title: Add new quantity to shinystan object
### Aliases: generate_quantity

### ** Examples

# Using example shinystan object 'eight_schools'
sso <- eight_schools
sso <- generate_quantity(sso, fun = function(x) x^2, 
                         param1 = "tau", new_name = "tau_sq")
sso <- generate_quantity(sso, fun = "-", 
                         param1 = "theta[1]", param2 = "theta[2]", 
                         new_name = "theta1minus2")
                         



