library(oppr)


### Name: add_absolute_targets
### Title: Add absolute targets
### Aliases: add_absolute_targets
###   add_absolute_targets,ProjectProblem,numeric-method
###   add_absolute_targets,ProjectProblem,character-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with minimum set objective and targets that require each
# feature to have a 30% chance of persisting into the future
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_absolute_targets(0.3) %>%
      add_binary_decisions()

# print problem
print(p1)

# build problem with minimum set objective and specify targets that require
# different levels of persistence for each feature
p2 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_absolute_targets(c(0.1, 0.2, 0.3, 0.4, 0.5)) %>%
      add_binary_decisions()

# print problem
print(p2)

# add a column name to the feature data with targets
sim_features$target <- c(0.1, 0.2, 0.3, 0.4, 0.5)

# build problem with minimum set objective and specify targets using
# column name in the feature data
p3 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_absolute_targets("target") %>%
      add_binary_decisions()

# print problem
print(p3)

## No test: 
# solve problems
s1 <- solve(p1)
s2 <- solve(p2)
s3 <- solve(p3)

# print solutions
print(s1)
print(s2)
print(s3)

# plot solutions
plot(p1, s1)
plot(p2, s2)
plot(p3, s3)
## End(No test)



