library(oppr)


### Name: add_relative_targets
### Title: Add relative targets
### Aliases: add_relative_targets
###   add_relative_targets,ProjectProblem,numeric-method
###   add_relative_targets,ProjectProblem,character-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with minimum set objective and targets that require each
# feature to have a level of persistence that is greater than or equal to
# 70% of the best project for conserving it
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_relative_targets(0.7) %>%
      add_binary_decisions()

# print problem
print(p1)

# build problem with minimum set objective and specify targets that require
# different levels of persistence for each feature
p2 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_relative_targets(c(0.2, 0.3, 0.4, 0.5, 0.6)) %>%
      add_binary_decisions()

# print problem
print(p2)

# add a column name to the feature data with targets
sim_features$target <- c(0.2, 0.3, 0.4, 0.5, 0.6)

# build problem with minimum set objective and specify targets using
# column name in the feature data
p3 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_relative_targets("target") %>%
      add_binary_decisions()

## No test: 
# print problem
print(p3)

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



