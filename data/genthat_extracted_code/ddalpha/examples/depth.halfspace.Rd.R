library(ddalpha)


### Name: depth.halfspace
### Title: Calculate Halfspace Depth
### Aliases: depth.halfspace
### Keywords: robust multivariate nonparametric

### ** Examples

# 3-dimensional normal distribution
data <- mvrnorm(200, rep(0, 3), 
                matrix(c(1, 0, 0,
                         0, 2, 0, 
                         0, 0, 1),
                nrow = 3))
x <- mvrnorm(10, rep(1, 3), 
             matrix(c(1, 0, 0,
                      0, 1, 0, 
                      0, 0, 1),
             nrow = 3))
              
# default - random Tukey depth
depths <- depth.halfspace(x, data)
cat("Depths: ", depths, "\n")

# default exact method - "recursive"
depths <- depth.halfspace(x, data, exact = TRUE)
cat("Depths: ", depths, "\n")

# method "line"
depths <- depth.halfspace(x, data, method = "line")
cat("Depths: ", depths, "\n")



