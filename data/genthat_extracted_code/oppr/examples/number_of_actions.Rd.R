library(oppr)


### Name: number_of_actions
### Title: Number of actions
### Aliases: number_of_actions number_of_actions,ProjectProblem-method
###   number_of_actions,OptimizationProblem-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with default solver
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions() %>%
     add_default_solver()

# print problem
print(p)

# print number of actions
number_of_actions(p)



