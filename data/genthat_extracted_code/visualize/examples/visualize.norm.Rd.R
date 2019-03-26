library(visualize)


### Name: visualize.norm
### Title: Visualize Normal Distribution
### Aliases: visualize.norm
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.norm(stat = 1, mu = 4, sd = 5, section = "lower") 

# Evaluates bounded region.
visualize.norm(stat = c(3,6), mu = 5, sd = 3, section = "bounded")

# Evaluates upper tail.
visualize.norm(stat = 1, mu = 3, sd = 2, section = "upper")




