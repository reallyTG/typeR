library(rpicosat)


### Name: picosat_sat
### Title: Solve SAT problems with the 'PicoSAT' solver
### Aliases: picosat_sat

### ** Examples

# solve a boolean formula
# (not a or b) and (not b or c)
# each variable is an integer
# negations are negative integers
formula <- list(
 c(-1L, 2L),
 c(-2L, 3L)
)
res <- picosat_sat(formula)
picosat_solution_status(res)

# set a variable to a fixed value
# e.g. a = TRUE and b = TRUE
res <- picosat_sat(formula, assumptions = c(1L, 2L))
picosat_solution_status(res)

# get further information about the solution process
picosat_variables(res)
picosat_added_original_clauses(res)
picosat_decisions(res)
picosat_propagations(res)
picosat_visits (res)
picosat_seconds(res)




