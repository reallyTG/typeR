library(visualize)


### Name: visualize.hyper
### Title: Visualize Hypergeometric Distribution
### Aliases: visualize.hyper
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.hyper(stat = 1, m=4, n=5, k=3, section = "lower", strict = 0) 

# Evaluates bounded region.
visualize.hyper(stat = c(2,4), m=14, n=5, k=2, section = "bounded", strict = c(0,1))

# Evaluates upper tail.
visualize.hyper(stat = 1, m=4, n=5, k=3, section = "upper", strict = 1)




