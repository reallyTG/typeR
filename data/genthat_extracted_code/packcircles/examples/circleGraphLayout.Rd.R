library(packcircles)


### Name: circleGraphLayout
### Title: Find an arrangement of circles satisfying a graph of adjacencies
### Aliases: circleGraphLayout

### ** Examples

## Simple example with two internal circles surrounded by
## four external circles. Internal circle IDs are 1 and 2.
internal <- list( c(1, 3, 4, 5), c(2, 3, 4, 6) )

## Uniform radius for external circles
external <- data.frame(id=3:6, radius=1.0)

## Generate the circle packing
packing <- circleGraphLayout(internal, external)




