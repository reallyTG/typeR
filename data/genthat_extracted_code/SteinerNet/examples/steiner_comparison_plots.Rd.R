library(SteinerNet)


### Name: steiner_comparison_plots
### Title: Plot simulated data
### Aliases: steiner_comparison_plots

### ** Examples

g <- graph("Cubical")

data <- steiner_simulation(type = c("SP", "KB", "SPM"),
                           graph = g,
                           ter_list = generate_st_samples(graph = g,
                                                          ter_number = c(2, 3),
                                                          prob = c(0.1, 0.2)))

steiner_comparison_plots(type = c("SP", "KB"),
                         method = c("runtime", "ter_freq"),
                         data = data,
                         outputname = "plot1.pdf")




