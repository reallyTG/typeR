library(plotrr)


### Name: dotplots
### Title: Creates histograms for a measure for each group/unit
### Aliases: dotplots

### ** Examples

a <- runif(1000, min = 0, max = 1)
b <- a + rnorm(1000, mean = 0, sd = 1)
c <- rep(c(1:10), times = 100)
data <- data.frame(a, b, c)
dotplots("a", "b", "c", data, 20)



