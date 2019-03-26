library(oppr)


### Name: plot_feature_persistence
### Title: Plot a bar plot to visualize a project prioritization
### Aliases: plot_feature_persistence

### ** Examples

# set seed for reproducibility
set.seed(500)

# load the ggplot2 R package to customize plots
library(ggplot2)

# load data
data(sim_projects, sim_features, sim_actions)

# build problem
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
      add_max_richness_objective(budget = 400) %>%
      add_feature_weights("weight") %>%
      add_binary_decisions() %>%
      add_heuristic_solver(n = 10)

## No test: 
# solve problem
s <- solve(p)

# plot the first solution
plot(p, s)

# plot the second solution
plot(p, s, n = 2)

# since this function returns a ggplot2 plot object, we can customize the
# appearance of the plot using standard ggplot2 commands!
# for example, we can add a title
plot(p, s) + ggtitle("solution")

# we can also obtain the raw plotting data using return_data=TRUE
plot_data <- plot(p, s, return_data = TRUE)
print(plot_data)
## End(No test)



