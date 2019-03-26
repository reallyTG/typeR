library(ompr)


### Name: get_column_duals
### Title: Gets the column duals of a solution
### Aliases: get_column_duals

### ** Examples

## Not run: 
##D result <- MIPModel() %>%
##D   add_variable(x[i], i = 1:5) %>%
##D   add_variable(y[i, j], i = 1:5, j = 1:5) %>%
##D   add_constraint(x[i] >= 1, i = 1:5) %>%
##D   set_bounds(x[i], lb = 3, i = 1:3) %>%
##D   set_objective(sum_expr(i * x[i], i = 1:5)) %>%
##D   solve_model(with_ROI("glpk"))
##D 
##D get_column_duals(result)
## End(Not run)




