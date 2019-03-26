library(visualize)


### Name: visualize.geom
### Title: Visualize Geometric Distribution
### Aliases: visualize.geom
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.geom(stat = 1, prob = 0.5, section = "lower", strict = FALSE) 

# Evaluates bounded region.
visualize.geom(stat = c(1,3), prob = 0.35, section = "bounded", strict = c(0,1))

# Evaluates upper tail.
visualize.geom(stat = 1, prob = 0.5, section = "upper", strict = 1)




