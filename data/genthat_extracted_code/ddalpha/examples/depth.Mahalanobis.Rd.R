library(ddalpha)


### Name: depth.Mahalanobis
### Title: Calculate Mahalanobis Depth
### Aliases: depth.Mahalanobis
### Keywords: robust multivariate nonparametric

### ** Examples

# 5-dimensional normal distribution
data <- mvrnorm(1000, rep(0, 5), 
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
                
depths <- depth.Mahalanobis(x, data)
cat("Depths moment: ", depths, "\n")
depths <- depth.Mahalanobis(x, data, mah.estimate = "MCD", mah.parMcd = 0.75)
cat("Depths MCD: ", depths, "\n")



