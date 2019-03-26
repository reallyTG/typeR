library(oppr)


### Name: add_manual_locked_constraints
### Title: Add manually specified locked constraints
### Aliases: add_manual_locked_constraints
###   add_manual_locked_constraints,ProjectProblem,data.frame-method
###   add_manual_locked_constraints,ProjectProblem,tbl_df-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)


# create data frame with locked statuses
status <- data.frame(action = sim_actions$name[1:2],
                     status = c(0, 1))

# print locked statuses
print(status)

# build problem with minimum set objective and targets that require each
# feature to have a 30% chance of persisting into the future
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_richness_objective(budget = 500) %>%
      add_manual_locked_constraints(status) %>%
      add_binary_decisions()

# print problem
print(p)

## No test: 
# solve problem
s <- solve(p)

# print solution
print(s)
## End(No test)




