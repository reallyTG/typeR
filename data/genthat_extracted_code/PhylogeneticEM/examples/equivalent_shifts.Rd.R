library(PhylogeneticEM)


### Name: equivalent_shifts
### Title: Find all equivalent shifts allocations and values.
### Aliases: equivalent_shifts

### ** Examples

## Simualte a tree
set.seed(17920902)
ntaxa = 20
phylo <- TreeSim::sim.bd.taxa.age(n = ntaxa, numbsim = 1, lambda = 0.1,
                                  mu = 0, age = 1, mrca = TRUE)[[1]]

## Define parameters (BM, fixed root)
params <- params_BM(p = 4, edges = c(4, 17, 22),
                    values = cbind(1:4, -(1:4), rep(1, 4)))
## Find equivalent solutions and plot them
eq_shifts <- equivalent_shifts(phylo, params)
eq_shifts
plot(eq_shifts)
## Extract the values
# Shifts values for trait 2, for the three shifts (rows), and three solutions (columns)
extract(eq_shifts, trait = 2, what = "shifts_values")
# Root values for trait 4, for the tree solutions (columns)
extract(eq_shifts, trait = 4, what = "root_values")

## Define parameters (OU, stationary root)
params <- params_OU(p = 4, edges = c(4, 17, 22),
                    values = cbind(1:4, -(1:4), rep(1, 4)),
                    random = TRUE)
## Find equivalent solutions and plot them
eq_shifts <- equivalent_shifts(phylo, params)
eq_shifts
plot(eq_shifts)
## Extract the values
# Shifts values for trait 2, for the three shifts (rows), and three solutions (columns)
extract(eq_shifts, trait = 2, what = "shifts_values")
# Root values for trait 4, for the three solutions (columns)
extract(eq_shifts, trait = 4, what = "root_values")




