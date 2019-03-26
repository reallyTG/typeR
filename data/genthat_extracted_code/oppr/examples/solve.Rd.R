library(oppr)


### Name: solve
### Title: Solve
### Aliases: solve solve,OptimizationProblem,Solver-method
###   solve,ProjectProblem,missing-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# print project data
print(sim_projects)

# print action data
print(sim_features)

# print feature data
print(sim_actions)

# build problem
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 400) %>%
     add_feature_weights("weight") %>%
     add_binary_decisions()

# print problem
print(p)

## No test: 
# solve problem
s <- solve(p)

# print output
print(s)

# print the solver status
print(s$obj)

# print the objective value
print(s$obj)

# print the solution cost
print(s$cost)

# print which actions are funded in the solution
s[, sim_actions$name, drop = FALSE]

# print the expected probability of persistence for each feature
# if the solution were implemented
s[, sim_features$name, drop = FALSE]
## End(No test)



