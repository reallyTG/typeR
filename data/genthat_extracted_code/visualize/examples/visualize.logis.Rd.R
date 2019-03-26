library(visualize)


### Name: visualize.logis
### Title: Visualize Logistic distribution
### Aliases: visualize.logis
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.logis(stat = 1, location = 4, scale = 2, section = "lower") 

# Evaluates bounded region.
visualize.logis(stat = c(3,5), location = 4, scale = 2, section = "bounded") 

# Evaluates upper tail.
visualize.logis(stat = 1, location = 4, scale = 2, section = "upper") 




