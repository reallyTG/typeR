library(oppr)


### Name: add_max_phylo_div_objective
### Title: Add maximum phylogenetic diversity objective
### Aliases: add_max_phylo_div_objective

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions, sim_tree)

# plot tree
plot(sim_tree)

# build problem with maximum phylogenetic diversity objective and $300 budget
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_phylo_div_objective(budget = 300, tree = sim_tree) %>%
      add_binary_decisions()

## No test: 
# solve problem
s1 <- solve(p1)

# print solution
print(s1)

# plot solution
plot(p1, s1)

# build another problem that includes feature weights
p2 <- p1 %>%
      add_feature_weights("weight")

# solve problem with feature weights
s2 <- solve(p2)

# print solution based on feature weights
print(s2)

# plot solution based on feature weights
plot(p2, s2)
## End(No test)



