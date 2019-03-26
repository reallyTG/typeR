library(SteinerNet)


### Name: steiner_comparison_wilcox
### Title: Perform wilcox test
### Aliases: steiner_comparison_wilcox

### ** Examples

g <- graph("Cubical")

data <- steiner_simulation(type = c("SP", "KB", "SPM"),
                           graph = g,
                           ter_list = generate_st_samples(graph = g,
                                                          ter_number = c(2, 3),
                                                          prob = c(0.1, 0.2)))

steiner_comparison_wilcox(type = c("SP", "KB"),
                          method = "ter_freq",
                          data = data)




