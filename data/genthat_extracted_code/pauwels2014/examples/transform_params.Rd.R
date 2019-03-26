library(pauwels2014)


### Name: transform_params
### Title: User defined parameter transformation function.
### Aliases: transform_params
### Keywords: Model specific functions

### ** Examples

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

knobj$global_parameters$true_params_T
transform_params(knobj$global_parameters$true_params_T)



