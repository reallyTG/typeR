library(bayesmix)


### Name: darwin
### Title: Differences in heights between plants
### Aliases: darwin
### Keywords: datasets

### ** Examples

data("darwin", package = "bayesmix")
## Estimated sample density
plot(density(darwin[[1]]), ylim = c(0, 0.02), main = "Outlier modelling")
ss <- seq(-100, 100, by = 1)
## Normal density with estimated mean and sd of whole sample
lines(ss, dnorm(ss, mean = mean(darwin[[1]]), sd = sd(darwin[[1]])), col = "red")
## Normal density with estimated mean and sd of sample, where the 2
## extremely small values are removed
lines(ss, dnorm(ss, mean = mean(darwin[-c(1:2),1]),
      sd = sd(darwin[-c(1:2),1])), col = "green")



