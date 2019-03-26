library(visualize)


### Name: visualize.pois
### Title: Visualize Poisson Distribution
### Aliases: visualize.pois
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.pois(stat = 1, lambda = 2, section = "lower", strict = FALSE) 

# Evaluates bounded region.
visualize.pois(stat = c(1,3), lambda = 3, section = "bounded", strict = c(0,1))

# Evaluates upper tail.
visualize.pois(stat = 1, lambda = 2, section = "upper", strict = 1)




