library(oppr)


### Name: add_feature_weights
### Title: Add feature weights
### Aliases: add_feature_weights
###   add_feature_weights,ProjectProblem,numeric-method
###   add_feature_weights,ProjectProblem,character-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# print feature data
print(sim_features)

# build problem with maximum richness objective, $300 budget, and no weights
p1 <- problem(sim_projects, sim_actions, sim_features,
              "name", "success", "name", "cost", "name") %>%
      add_max_richness_objective(budget = 200) %>%
      add_binary_decisions()

# print problem
print(p1)

# build another problem, and specify feature weights using the values in the
# "weight" column of the sim_features table by specifying the column
# name "weight"
p2 <- p1 %>%
      add_feature_weights("weight")

# print problem
print(p2)

# build another problem, and specify feature weights using the
# values in the "weight column of the sim_features table, but
# actually input the values rather than specifying the column name
# "weights" column of the sim_features table
p3 <- p1 %>%
      add_feature_weights(sim_features$weight)

# print problem
print(p3)

## No test: 
# solve the problems
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



