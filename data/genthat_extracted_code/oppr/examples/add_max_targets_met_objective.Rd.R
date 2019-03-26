library(oppr)


### Name: add_max_targets_met_objective
### Title: Add maximum targets met objective
### Aliases: add_max_targets_met_objective

### ** Examples

# load the ggplot2 R package to customize plot
library(ggplot2)

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum targets met objective, a $200 budget,
# targets that require each feature to have a 20% chance of persisting into
# the future, and zero cost actions locked in
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_targets_met_objective(budget = 200) %>%
      add_absolute_targets(0.2) %>%
      add_locked_in_constraints(which(sim_actions$cost < 1e-5)) %>%
      add_binary_decisions()

## No test: 
# solve problem
s1 <- solve(p1)

# print solution
print(s1)

# plot solution, and add a dashed line to indicate the feature targets
# we can see the three features meet the targets under the baseline
# scenario, and the project for F3 was prioritized for funding
# so that its probability of persistence meets the target
plot(p1, s1) +
geom_hline(yintercept = 0.2, linetype = "dashed")
## End(No test)

# build another problem that includes feature weights
p2 <- p1 %>%
      add_feature_weights("weight")

## No test: 
# solve problem
s2 <- solve(p2)

# print solution
print(s2)

# plot solution, and add a dashed line to indicate the feature targets
# we can see that adding weights to the problem has changed the solution
# specifically, the projects for feature F1 and F5 have been funded
# to enhance their probability of persistence
plot(p2, s2) +
geom_hline(yintercept = 0.2, linetype = "dashed")
## End(No test)



