library(particles)


### Name: simulate
### Title: Start a simulation based on a graph
### Aliases: simulate is.simulation simulation record clear_history
###   get_history history_length reheat particles position velocity
###   evolutions

### ** Examples

graph <- tidygraph::create_notable('folkman')
graph %>%
  simulate()




