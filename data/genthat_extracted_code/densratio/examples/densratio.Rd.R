library(densratio)


### Name: densratio
### Title: Estimate Density Ratio p_nu(x)/p_de(y)
### Aliases: densratio

### ** Examples

set.seed(3)
x <- rnorm(200, mean = 1, sd = 1/8)
y <- rnorm(200, mean = 1, sd = 1/2)
densratio(x, y)




