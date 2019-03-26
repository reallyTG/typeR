library(oppr)


### Name: number_of_projects
### Title: Number of projects
### Aliases: number_of_projects number_of_projects,ProjectProblem-method
###   number_of_projects,OptimizationProblem-method

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

# print number of projects
number_of_projects(p)



