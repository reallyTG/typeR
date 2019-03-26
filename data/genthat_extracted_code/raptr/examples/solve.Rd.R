library(raptr)


### Name: solve
### Title: Solve RAP object
### Aliases: solve solve,RapUnsolOrSol,missing-method
###   solve,RapUnsolOrSol,GurobiOpts-method
###   solve,RapUnsolOrSol,matrix-method solve,RapUnsolOrSol,numeric-method
###   solve,RapUnsolOrSol,logical-method

### ** Examples

# load RapUnsolved object
data(sim_ru)
## No test: 
# solve it using Gurobi
sim_rs <- solve(sim_ru)

# evaluate manually specified solution using planning unit indices
sim_rs2 <- solve(sim_ru, seq_len(10))

# evaluate manually specifed solution using binary selections
sim_rs3 <- solve(sim_ru, c(rep(TRUE, 10), rep(FALSE, 90)))

#  evaluate multiple manually specified solutions
sim_rs4 <- solve(sim_ru, matrix(sample(c(0, 1), size = 500, replace = TRUE),
                 ncol = 100, nrow = 5))
## End(No test)




