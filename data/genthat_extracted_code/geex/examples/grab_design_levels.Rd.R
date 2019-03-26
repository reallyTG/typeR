library(geex)


### Name: grab_design_levels
### Title: Grab a list of the levels of factor variables in a model.
### Aliases: grab_design_levels

### ** Examples

## Not run: 
##D   geex::grab_design_matrix(
##D     data = data,
##D     rhs_formula = geex::grab_fixed_formula(model),
##D     xlev = geex::grab_design_levels(model)
##D   )
##D   ## Below is helpful within an eeFun.
##D   geex::grab_psiFUN(
##D     data = data,## Especially when this is a subset of the data
##D     rhs_formula = geex::grab_fixed_formula(model),
##D     xlev = geex::grab_design_levels(model)
##D   )
## End(Not run)



