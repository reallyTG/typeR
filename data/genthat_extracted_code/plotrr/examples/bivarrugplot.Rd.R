library(plotrr)


### Name: bivarrugplot
### Title: Plots the bivariate relationship between two measures and a
###   rugplot for each measure
### Aliases: bivarrugplot

### ** Examples

a <- runif(1000, min = 0, max = 1)
b <- a + rnorm(1000, mean = 0, sd = 1)
data <- data.frame(a, b)
bivarrugplot("a", "b", data)



