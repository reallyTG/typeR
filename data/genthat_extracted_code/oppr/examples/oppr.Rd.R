library(oppr)


### Name: oppr
### Title: 'oppr': Optimal Project Prioritization
### Aliases: oppr oppr-package

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

# print which actions are funded in the solution
s[, sim_actions$name, drop = FALSE]

# print the expected probability of persistence for each feature
# if the solution were implemented
s[, sim_features$name, drop = FALSE]

# visualize solution
plot(p, s)
## End(No test)



