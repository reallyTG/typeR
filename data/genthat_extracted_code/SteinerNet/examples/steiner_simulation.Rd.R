library(SteinerNet)


### Name: steiner_simulation
### Title: Execute Steiner Algorithms and calculate parameters of output
###   trees
### Aliases: steiner_simulation

### ** Examples

g <- graph("Cubical")

steiner_simulation(type = c("SP", "KB", "SPM"),
                   graph = g,
                   ter_list = generate_st_samples(graph = g,
                                                  ter_number = c(2, 3),
                                                  prob = c(0.1, 0.2)))
                   
steiner_simulation(type = c("EXA", "RSP"),
                   graph = g,
                   ter_list = c(1, 3, 8))




