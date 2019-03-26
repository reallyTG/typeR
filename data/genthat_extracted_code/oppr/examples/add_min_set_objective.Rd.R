library(oppr)


### Name: add_min_set_objective
### Title: Add minimum set objective
### Aliases: add_min_set_objective

### ** Examples

# load the ggplot2 R package to customize plot
library(ggplot2)

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with minimum set objective and targets that require each
# feature to have a 30% chance of persisting into the future
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_absolute_targets(0.3) %>%
      add_binary_decisions()

## No test: 
# solve problem
s <- solve(p)

# print solution
print(s)

# plot solution, and add a dashed line to indicate the feature targets
plot(p, s) +
geom_hline(yintercept = 0.3, linetype = "dashed")
## End(No test)



