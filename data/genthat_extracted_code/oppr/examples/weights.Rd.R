library(oppr)


### Name: weights
### Title: Weights
### Aliases: weights

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum richness objective, $300 budget, and
# feature weights
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_feature_weights("weight") %>%
     add_binary_decisions()

## No test: 
# solve problem
s <- solve(p)

# print solution
print(s)

# plot solution
plot(p, s)
## End(No test)



