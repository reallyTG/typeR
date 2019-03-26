library(visualize)


### Name: visualize.f
### Title: Visualize F distribution
### Aliases: visualize.f
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.f(stat = 1, df1 = 5, df2 = 4, section = "lower") 

# Evaluates bounded region.
visualize.f(stat = c(3,5), df1 = 6, df2 = 3, section = "bounded") 

# Evaluates upper tail.
visualize.f(stat = 1, df1 = 5, df2 = 4, section = "upper") 




