library(particles)


### Name: genesis
### Title: Particle initialisation
### Aliases: genesis phyllotactic_genesis predefined_genesis
###   bigbang_genesis aquarium_genesis petridish_genesis

### ** Examples

# A contrieved example
graph <- tidygraph::create_notable('bull')
genesis <- phyllotactic_genesis()
genesis(graph)

# Usually used as an argument to simulate
graph %>%
  simulate(setup = phyllotactic_genesis())




