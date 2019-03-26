library(oppr)


### Name: add_rsymphony_solver
### Title: Add a SYMPHONY solver with 'Rsymphony'
### Aliases: add_rsymphony_solver

### ** Examples

## No test: 
# load data
data(sim_projects, sim_features, sim_actions)

# build problem with Rsymphony solver
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions() %>%
     add_rsymphony_solver()

# print problem
print(p)

# solve problem
s <- solve(p)

# print solution
print(s)

# plot solution
plot(p, s)
## End(No test)



