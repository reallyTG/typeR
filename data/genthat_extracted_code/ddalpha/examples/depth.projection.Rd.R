library(ddalpha)


### Name: depth.projection
### Title: Calculate Projection Depth
### Aliases: depth.projection
### Keywords: robust multivariate nonparametric

### ** Examples

  # 5-dimensional normal distribution
  data <- mvrnorm(100, rep(0, 5), 
                  matrix(c(1, 0, 0, 0, 0, 
                           0, 2, 0, 0, 0, 
                           0, 0, 3, 0, 0, 
                           0, 0, 0, 2, 0, 
                           0, 0, 0, 0, 1),
                         nrow = 5))
  x <- mvrnorm(10, rep(1, 5), 
               matrix(c(1, 0, 0, 0, 0, 
                        0, 1, 0, 0, 0, 
                        0, 0, 1, 0, 0, 
                        0, 0, 0, 1, 0, 
                        0, 0, 0, 0, 1),
                      nrow = 5))
  
  depths <- depth.projection(x, data, method = "random", num.directions = 1000)
  cat("Depths random: ", depths, "\n")
  depths <- depth.projection(x, data, method = "linearize")
  cat("Depths linearize: ", depths, "\n")



