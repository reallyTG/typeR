library(oppr)


### Name: add_heuristic_solver
### Title: Add a heuristic solver
### Aliases: add_heuristic_solver

### ** Examples

# load ggplot2 package for making plots
library(ggplot2)

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with heuristic solver and $200
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions() %>%
     add_heuristic_solver()

# print problem
print(p1)

## No test: 
# solve problem
s1 <- solve(p1)

# print solution
print(s1)

# plot solution
plot(p1, s1)
## End(No test)



