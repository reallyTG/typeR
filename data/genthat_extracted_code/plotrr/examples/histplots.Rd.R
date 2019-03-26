library(plotrr)


### Name: histplots
### Title: Creates histograms for a measure for each group/unit
### Aliases: histplots

### ** Examples

a <- runif(1000, min = 0, max = 1)
b <- a + rnorm(1000, mean = 0, sd = 1)
c <- rep(c(1:10), times = 100)
data <- data.frame(a, b, c)
histplots("a", "b", "c", data, 5)



