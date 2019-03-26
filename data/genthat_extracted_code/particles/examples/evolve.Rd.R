library(particles)


### Name: evolve
### Title: Move the simulation forward one or more steps
### Aliases: evolve

### ** Examples

graph <- tidygraph::create_notable('folkman')
sim <- graph %>%
  simulate() %>%
  wield(link_force) %>%
  wield(manybody_force)

# Take 5 steps and tell about it
sim %>% evolve(5, function(sim) {
  cat('Generation: ', evolutions(sim), '\n', sep = '')
})

# Run evolution until alpha_min is reached
sim %>% evolve(NULL)




