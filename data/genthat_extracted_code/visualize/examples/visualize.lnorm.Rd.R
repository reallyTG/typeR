library(visualize)


### Name: visualize.lnorm
### Title: Visualize Log Normal Distribution
### Aliases: visualize.lnorm
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.lnorm(stat = 1, meanlog = 3, sdlog = 1, section = "lower") 

# Evaluates bounded region.
visualize.lnorm(stat = c(3,5), meanlog = 3, sdlog = 3, section = "bounded") 

# Evaluates upper tail.
visualize.lnorm(stat = 1, meanlog = 3, sdlog = 1, section = "upper") 




