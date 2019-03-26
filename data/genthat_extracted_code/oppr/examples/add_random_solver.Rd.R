library(oppr)


### Name: add_random_solver
### Title: Add a random solver
### Aliases: add_random_solver

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with random solver, and generate 100 random solutions
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions() %>%
     add_random_solver(number_solutions = 100)

# print problem
print(p1)

# solve problem
s1 <- solve(p1)

# print solutions
print(s1)

# plot first random solution
plot(p1, s1)

# plot histogram of the objective values for the random solutions
hist(s1$obj, xlab = "Expected richness", xlim = c(0, 2.5),
     main = "Histogram of random solutions")

# since the objective values don't tell us much about the quality of the
# solutions, we can find the optimal solution and calculate how different
# each of the random solutions is from optimality

## No test: 
# find the optimal objective value using an exact algorithms solver
s2 <- p1 %>%
      add_default_solver() %>%
      solve()

# create new column in s1 with percent difference from optimality
s1$optimality_diff <- ((s2$obj - s1$obj) / s1$obj) * 100

# plot histogram showing the quality of the random solutions
# higher numbers indicate worse solutions
hist(s1$optimality_diff, xlab = "Difference from optimality (%)",
     main = "Histogram of random solutions", xlim = c(0, 50))
## End(No test)



