library(Renext)


### Name: Hpoints
### Title: Plotting positions for exponential return levels
### Aliases: Hpoints

### ** Examples

n <- 30
set.seed(1234)
x <- rGPD(n, shape = 0.2)
plot(exp(Hpoints(n)), sort(x), log = "x",
     main = "Basic return level plot")




