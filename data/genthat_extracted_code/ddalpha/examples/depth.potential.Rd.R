library(ddalpha)


### Name: depth.potential
### Title: Calculate Potential of the Data
### Aliases: depth.potential
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

# potential with rule of thumb bandwidth
pot <- depth.potential(x, data)
cat("Potentials: ", pot, "\n")

# potential with bandwidth = 0.1
pot <- depth.potential(x, data, kernel.bandwidth = 0.1)
cat("Potentials: ", pot, "\n")

# potential with robust MCD scaling
pot <- depth.potential(x, data, kernel.bandwidth = 0.1, 
                      pretransform = "NMCD", mah.parMcd = 0.6)
cat("Potentials: ", pot, "\n")



