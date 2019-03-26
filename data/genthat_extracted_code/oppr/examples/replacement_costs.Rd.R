library(oppr)


### Name: replacement_costs
### Title: Replacement cost
### Aliases: replacement_costs

### ** Examples

## No test: 
# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum richness objective and $400 budget
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 400) %>%
     add_feature_weights("weight") %>%
     add_binary_decisions()

# solve problem
s <- solve(p)

# print solution
print(s)

# calculate replacement cost values
r <- replacement_costs(p, s)

# print output
print(r)

# plot histogram of replacement costs,
# with this objective, greater values indicate greater irreplaceability
hist(r$rep_cost, xlab = "Replacement cost", main = "")
## End(No test)



