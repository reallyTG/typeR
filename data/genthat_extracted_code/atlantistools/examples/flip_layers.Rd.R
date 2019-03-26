library(atlantistools)


### Name: flip_layers
### Title: Flip layers for visualization.
### Aliases: flip_layers

### ** Examples

data <- rbind(expand.grid(species = "sp1", polygon = 0, layer = 0:7),
              expand.grid(species = "sp1", polygon = 1, layer = 0:4),
              expand.grid(species = "sp1", polygon = 2, layer = 0:2),
              expand.grid(species = "sp1", polygon = 3, layer = c(0:3, 7)))
data$atoutput <- runif(nrow(data), min = 0, max = 2)
flip_layers(data)



