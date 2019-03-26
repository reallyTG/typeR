library(NLMR)


### Name: nlm_curds
### Title: nlm_curds
### Aliases: nlm_curds

### ** Examples


# simulate random curdling
(random_curdling <- nlm_curds(curds = c(0.5, 0.3, 0.6),
                              recursion_steps = c(32, 6, 2)))

# simulate wheyed curdling
(wheyed_curdling <- nlm_curds(curds = c(0.5, 0.3, 0.6),
                              recursion_steps = c(32, 6, 2),
                              wheyes = c(0.1, 0.05, 0.2)))
## Not run: 
##D # Visualize the NLMs
##D landscapetools::show_landscape(random_curdling)
##D landscapetools::show_landscape(wheyed_curdling)
## End(Not run)




