library(visualize)


### Name: visualize.nbinom
### Title: Visualize Negative Binomial Distribution
### Aliases: visualize.nbinom
### Keywords: visualize

### ** Examples


# Evaluates lower tail.
visualize.nbinom(stat = 1, size = 5, prob = 0.5, section = "lower", strict = 0) 

# Evaluates bounded region.
visualize.nbinom(stat = c(1,3), size = 10, prob = 0.35, section = "bounded",
                    strict = c(TRUE, FALSE))

# Evaluates upper tail.
visualize.nbinom(stat = 1, size = 5, prob = 0.5, section = "upper", strict = 1)




