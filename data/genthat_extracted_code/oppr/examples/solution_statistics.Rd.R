library(oppr)


### Name: solution_statistics
### Title: Solution statistics
### Aliases: solution_statistics

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# print project data
print(sim_projects)

# print action data
print(sim_features)

# print feature data
print(sim_actions)

# build problem
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 400) %>%
     add_feature_weights("weight") %>%
     add_binary_decisions()

# print problem
print(p)

# create a table with some solutions
solutions <- data.frame(F1_action =       c(0, 1, 1),
                        F2_action =       c(0, 1, 0),
                        F3_action =       c(0, 1, 1),
                        F4_action =       c(0, 1, 0),
                        F5_action =       c(0, 1, 1),
                        baseline_action = c(1, 1, 1))

# print the solutions
# the first solution only has the baseline action funded
# the second solution has every action funded
# the third solution has only some actions funded
print(solutions)

# calculate statistics
solution_statistics(p, solutions)



