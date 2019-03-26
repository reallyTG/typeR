library(oppr)


### Name: add_gurobi_solver
### Title: Add a 'Gurobi' solver
### Aliases: add_gurobi_solver

### ** Examples

## No test: 
# load data
data(sim_projects, sim_features, sim_actions)

# build problem
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

# build another problem, and specify the Gurobi solver
p2 <- p1 %>%
      add_gurobi_solver()

# print problem
print(p2)

# solve problem
s2 <- solve(p2)

# print solution
print(s2)

# plot solution
plot(p2, s2)

# build another problem and obtain multiple solutions
# note that this problem doesn't have 100 unique solutions so
# the solver won't return 100 solutions
p3 <- p1 %>%
      add_gurobi_solver(number_solutions = 100)

# print problem
print(p3)

# solve problem
s3 <- solve(p3)

# print solutions
print(s3)
## End(No test)



