library(ddalpha)


### Name: depth.simplicial
### Title: Calculate Simplicial Depth
### Aliases: depth.simplicial
### Keywords: robust multivariate nonparametric

### ** Examples

# 3-dimensional normal distribution
data <- mvrnorm(20, rep(0, 3), 
                matrix(c(1, 0, 0,
                         0, 2, 0,
                         0, 0, 1),
                       nrow = 3))
x <- mvrnorm(10, rep(1, 3), 
             matrix(c(1, 0, 0,
                      0, 1, 0,
                      0, 0, 1),
                    nrow = 3))

#exact
depths <- depth.simplicial(x, data, exact = TRUE)
cat("Depths: ", depths, "\n")

#approximative
depths <- depth.simplicial(x, data, exact = FALSE, k = 0.2)
cat("Depths: ", depths, "\n")



