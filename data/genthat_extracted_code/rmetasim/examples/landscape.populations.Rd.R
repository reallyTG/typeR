library(rmetasim)


### Name: landscape.populations
### Title: return a vector of population IDs from a landscape
### Aliases: landscape.populations
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.example()
  exampleland <- landscape.simulate(exampleland, 4)
  plot(table(landscape.populations(exampleland)),
       main="Distribution of population size in landscape")
  rm(exampleland)



