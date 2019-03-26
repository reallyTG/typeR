library(oppr)


### Name: action_names
### Title: Action names
### Aliases: action_names action_names,ProjectProblem-method

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

# print action names
action_names(p)



