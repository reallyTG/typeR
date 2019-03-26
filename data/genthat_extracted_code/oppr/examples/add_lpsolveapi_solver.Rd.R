library(oppr)


### Name: add_lpsolveapi_solver
### Title: Add a lp_solve solver with 'lpSolveAPI'
### Aliases: add_lpsolveapi_solver

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with lpSolveAPI solver
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions() %>%
     add_lpsolveapi_solver()

# print problem
print(p)

# solve problem
s <- solve(p)

# print solution
print(s)

# plot solution
plot(p, s)



