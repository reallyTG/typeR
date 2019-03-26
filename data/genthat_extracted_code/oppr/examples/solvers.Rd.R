library(oppr)


### Name: solvers
### Title: Problem solvers
### Aliases: solvers

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

# build another problem, with the default solver
p2 <- p1 %>%
      add_default_solver()

# build another problem, with the gurobi solver
## No test: 
p3 <- p1 %>%
      add_gurobi_solver()
## End(No test)

# build another problem, with the Rsympony solver
## No test: 
p4 <- p1 %>%
      add_rsymphony_solver()
## End(No test)

# build another problem, with the lpsymphony solver
## No test: 
p5 <- p1 %>%
      add_lpsymphony_solver()
## End(No test)

# build another problem, with the lpSolveAPI solver
p6 <- p1 %>%
      add_lpsolveapi_solver()

# build another problem, with the heuristic solver
p7 <- p1 %>%
      add_heuristic_solver()

# build another problem, with the random solver
p8 <- p1 %>%
      add_random_solver()

## No test: 
# generate solutions using each of the solvers
s <- rbind(solve(p2), solve(p3), solve(p4), solve(p5), solve(p6), solve(p7),
           solve(p8))
s$solver <- c("default", "gurobi", "Rsymphony", "lpsymphony", "lpSolveAPI",
              "heuristic", "random")

# print solutions
print(as.data.frame(s))
## End(No test)



