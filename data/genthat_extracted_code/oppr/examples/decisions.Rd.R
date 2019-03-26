library(oppr)


### Name: decisions
### Title: Specify the type of decisions
### Aliases: decisions

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum richness objective, $200 budget, and
# binary decisions
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

# print problem
print(p)

## No test: 
# solve problem
s <- solve(p)

# print solution
print(s)

# plot solution
plot(p, s)
## End(No test)



