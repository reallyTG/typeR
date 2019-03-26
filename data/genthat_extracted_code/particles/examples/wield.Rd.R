library(particles)


### Name: impose
### Title: Assign a force or constraint to a simulation
### Aliases: impose reimpose unimpose wield rewield unwield

### ** Examples

graph <- tidygraph::create_notable('folkman')
graph %>%
  simulate() %>%
  wield(link_force)




