library(plotrr)


### Name: bivarplots
### Title: Plots the bivariate relationship between two measures for each
###   group/unit
### Aliases: bivarplots

### ** Examples

a <- runif(1000, min = 0, max = 1)
b <- a + rnorm(1000, mean = 0, sd = 1)
c <- rep(c(1:10), times = 100)
data <- data.frame(a, b, c)
bivarplots("a", "b", "c", data)



