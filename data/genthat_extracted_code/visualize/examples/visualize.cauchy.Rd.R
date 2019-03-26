library(visualize)


### Name: visualize.cauchy
### Title: Visualize Cauchy Distribution
### Aliases: visualize.cauchy
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.cauchy(stat = 1, location = 4, scale = 2, section = "lower") 

# Evaluates bounded region.
visualize.cauchy(stat = c(3,5), location = 5, scale = 3, section = "bounded") 

# Evaluates upper tail.
visualize.cauchy(stat = 1, location = 4, scale = 2, section = "upper") 




