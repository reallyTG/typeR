library(dynfrail)


### Name: dynfrail_control
### Title: Control parameters for dynfrail
### Aliases: dynfrail_control

### ** Examples

dynfrail_control()
# this stops each EM (inner maximization) after 10 iterations, event if it did not
# reach the maximum.
dynfrail_control(inner_control = list(maxit = 10))




