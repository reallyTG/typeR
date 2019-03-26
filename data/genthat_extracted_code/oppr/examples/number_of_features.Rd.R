library(oppr)


### Name: number_of_features
### Title: Number of features
### Aliases: number_of_features number_of_features,ProjectProblem-method
###   number_of_features,OptimizationProblem-method

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

# print number of features
number_of_features(p)



