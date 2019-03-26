library(oppr)


### Name: add_locked_in_constraints
### Title: Add locked in constraints
### Aliases: add_locked_in_constraints
###   add_locked_in_constraints,ProjectProblem,numeric-method
###   add_locked_in_constraints,ProjectProblem,logical-method
###   add_locked_in_constraints,ProjectProblem,character-method

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# print action data
print(sim_actions)

# build problem with maximum richness objective and $150 budget
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 150) %>%
     add_binary_decisions()

# print problem
print(p1)

# build another problem, and lock in the 3rd action using numeric inputs
p2 <- p1 %>%
      add_locked_in_constraints(c(3))

# print problem
print(p2)

# build another problem, and lock in the actions using logical inputs from
# the sim_actions table
p3 <- p1 %>%
      add_locked_in_constraints(sim_actions$locked_in)

# print problem
print(p3)

# build another problem, and lock in the actions using the column name
# "locked_in" in the sim_actions table
# the sim_actions table
p4 <- p1 %>%
      add_locked_in_constraints("locked_in")

# print problem
print(p4)

## No test: 
# solve problems
s1 <- solve(p1)
s2 <- solve(p2)
s3 <- solve(p3)
s4 <- solve(p4)

# print the actions selected for funding in each of the solutions
print(s1[, sim_actions$name])
print(s2[, sim_actions$name])
print(s3[, sim_actions$name])
print(s4[, sim_actions$name])
## End(No test)



