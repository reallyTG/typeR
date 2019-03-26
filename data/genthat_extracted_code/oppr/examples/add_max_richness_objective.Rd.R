library(oppr)


### Name: add_max_richness_objective
### Title: Add maximum richness objective
### Aliases: add_max_richness_objective

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum richness objective and $300 budget
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

## No test: 
# solve problem
s1 <- solve(p1)

# print solution
print(s1)

# plot solution
plot(p1, s1)
## End(No test)

# build another problem that includes feature weights
p2 <- p1 %>%
     add_feature_weights("weight")

## No test: 
# solve problem with feature weights
s2 <- solve(p2)

# print solution based on feature weights
print(s2)

# plot solution based on feature weights
plot(p2, s2)
## End(No test)



