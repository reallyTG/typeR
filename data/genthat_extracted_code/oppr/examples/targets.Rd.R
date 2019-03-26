library(oppr)


### Name: targets
### Title: Targets
### Aliases: targets

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

# build problem with minimum set objective and targets that require each
# feature to have a level of persistence that is greater than or equal to
# 30% of the best project for conserving it
p2 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_relative_targets(0.3) %>%
      add_binary_decisions()

# print problem
print(p2)

## No test: 
# solve problems
s1 <- solve(p1)
s2 <- solve(p2)

# print solutions
print(s1)
print(s2)

# plot solutions
plot(p1, s1)
plot(p2, s2)
## End(No test)



