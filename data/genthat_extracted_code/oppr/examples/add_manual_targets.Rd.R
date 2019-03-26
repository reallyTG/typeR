library(oppr)


### Name: add_manual_targets
### Title: Add manual targets
### Aliases: add_manual_targets add_manual_targets-method
###   add_manual_targets,ProjectProblem,data.frame-method
###   add_manual_targets,ProjectProblem,tbl_df-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)


# create data frame with targets
targets <- data.frame(feature = sim_features$name,
                      type = "absolute",
                      target = 0.1)

# print targets
print(targets)

# build problem with minimum set objective and targets that require each
# feature to have a 30% chance of persisting into the future
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_min_set_objective() %>%
      add_manual_targets(targets) %>%
      add_binary_decisions()

# print problem
print(p)

## No test: 
# solve problem
s <- solve(p)

# print solution
print(s)
## End(No test)



