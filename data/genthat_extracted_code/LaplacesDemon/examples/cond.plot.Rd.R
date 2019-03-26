library(LaplacesDemon)


### Name: cond.plot
### Title: Conditional Plots
### Aliases: cond.plot
### Keywords: Plot

### ** Examples

library(LaplacesDemon)
x <- rnorm(1000)
y <- runif(1000)
z <- rcat(1000, rep(1/4,4))
cond.plot(x, y, z, Style="smoothscatter")



