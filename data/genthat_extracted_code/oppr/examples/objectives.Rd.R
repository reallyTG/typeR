library(oppr)


### Name: objectives
### Title: Problem objective
### Aliases: objectives

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions, sim_tree)

# build problem with maximum richness objective and $200 budget
p1 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

## No test: 
# solve problem
s1 <- solve(p1)

# print solution
print(s1)

# plot solution
plot(p1, s1)
## End(No test)

# build problem with maximum phylogenetic diversity objective and $200 budget
p2 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_phylo_div_objective(budget = 200, tree = sim_tree) %>%
     add_binary_decisions()

## No test: 
# solve problem
s2 <- solve(p2)

# print solution
print(s2)

# plot solution
plot(p2, s2)
## End(No test)
# build problem with maximum targets met objective, $200 budget, and
# 40% persistence targets
p3 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_targets_met_objective(budget = 200) %>%
     add_absolute_targets(0.4) %>%
     add_binary_decisions()

## No test: 
# solve problem
s3 <- solve(p3)

# print solution
print(s3)

# plot solution
plot(p3, s3)
## End(No test)

# build problem with minimum set objective, $200 budget, and 40%
# persistence targets
p4 <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_min_set_objective() %>%
     add_absolute_targets(0.4) %>%
     add_binary_decisions()

## No test: 
# solve problem
s4 <- solve(p4)

# print solution
print(s4)

# plot solution
plot(p4, s4)
## End(No test)



