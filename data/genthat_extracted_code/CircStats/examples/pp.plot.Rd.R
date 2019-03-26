library(CircStats)


### Name: pp.plot
### Title: von Mises Probability-Probability Plot
### Aliases: pp.plot
### Keywords: hplot

### ** Examples

data <- rvm(25, 0, 3)
pp.plot(data)
data <- c(rvm(20, 0, 7), rvm(20, pi, 7))
pp.plot(data)



