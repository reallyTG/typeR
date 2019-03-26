library(oppr)


### Name: compile
### Title: Compile a problem
### Aliases: compile compile.ProjectProblem

### ** Examples

# load data
data(sim_projects, sim_features, sim_actions)

# build problem with maximum richness objective, $200 budget, and
# binary decisions
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_richness_objective(budget = 200) %>%
     add_binary_decisions()

# print problem
print(p)

# compile problem
o <- compile(p)

# print compiled problem
print(o)



