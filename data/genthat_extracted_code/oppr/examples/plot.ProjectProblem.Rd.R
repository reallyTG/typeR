library(oppr)


### Name: plot.ProjectProblem
### Title: Plot a solution to a project prioritization problem
### Aliases: plot.ProjectProblem

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem without phylogenetic data
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_richness_objective(budget = 400) %>%
      add_feature_weights("weight") %>%
      add_binary_decisions()

## No test: 
# solve problem without phylogenetic data
s1 <- solve(p1)

# visualize solution without phylogenetic data
plot(p1, s1)
## End(No test)

# build problem with phylogenetic data
p2 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_phylo_div_objective(budget = 400, sim_tree) %>%
      add_binary_decisions()

## No test: 
# solve problem with phylogenetic data
s2 <- solve(p2)

# visualize solution with phylogenetic data
plot(p2, s2)
## End(No test)



