library(ompr)


### Name: get_solution
### Title: Get variable values from a solution
### Aliases: get_solution get_solution_

### ** Examples

## Not run: 
##D library(magrittr)
##D result <- MIPModel() %>%
##D      add_variable(x[i], i = 1:5) %>%
##D      add_variable(y[i, j], i = 1:5, j = 1:5) %>%
##D      add_constraint(x[i] >= 1, i = 1:5) %>%
##D      set_bounds(x[i], lb = 3, i = 1:3) %>%
##D      set_objective(0) %>%
##D      solve_model(with_ROI("glpk"))
##D solution <- get_solution(result, x[i])
##D solution2 <- get_solution(result, y[i, 1])
##D solution3 <- get_solution(result, y[i, j])
##D duals <- get_solution(result, x[i], type = "duals")
## End(Not run)




