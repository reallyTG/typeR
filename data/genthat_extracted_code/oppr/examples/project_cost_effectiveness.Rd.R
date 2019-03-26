library(oppr)


### Name: project_cost_effectiveness
### Title: Project cost effectiveness
### Aliases: project_cost_effectiveness

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

# calculate cost-effectiveness of each project
pce <- project_cost_effectiveness(p)

# print project costs, benefits, and cost-effectiveness values
print(pce)

# plot histogram of cost-effectiveness values
hist(pce$ce, xlab = "Cost effectiveness", main = "")



