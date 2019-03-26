library(oppr)


### Name: plot_phylo_persistence
### Title: Plot a phylogram to visualize a project prioritization
### Aliases: plot_phylo_persistence

### ** Examples

# set seed for reproducibility
set.seed(500)

# load the ggplot2 R package to customize plots
library(ggplot2)

data(sim_projects, sim_features, sim_actions)

# build problem
p <- problem(sim_projects, sim_actions, sim_features,
             "name", "success", "name", "cost", "name") %>%
     add_max_phylo_div_objective(budget = 400, sim_tree) %>%
     add_binary_decisions() %>%
     add_heuristic_solver(number_solutions = 10)

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

# we could also also set the minimum and maximum values in the color ramp to
# correspond to those in the data, rather than being capped at 0 and 1
plot(p, s) +
scale_color_gradientn(name = "Probability of\npersistence",
                      colors = viridisLite::inferno(150, begin = 0,
                                                    end = 0.9,
                                                    direction = -1)) +
ggtitle("solution")

# we could also change the color ramp
plot(p, s) +
scale_color_gradient(name = "Probability of\npersistence",
                     low = "red", high = "black") +
ggtitle("solution")

# we could even hide the legend if desired
plot(p, s) +
scale_color_gradient(name = "Probability of\npersistence",
                     low = "red", high = "black") +
theme(legend.position = "hide") +
ggtitle("solution")

# we can also obtain the raw plotting data using return_data=TRUE
plot_data <- plot(p, s, return_data = TRUE)
print(plot_data)
## End(No test)



