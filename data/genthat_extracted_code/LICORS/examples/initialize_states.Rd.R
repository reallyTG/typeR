library(LICORS)


### Name: initialize_states
### Title: State initialization for iterative algorithms (randomly or
###   variants of kmeans)
### Aliases: initialize_states
### Keywords: datagen distribution multivariate

### ** Examples

x1 <- rnorm(1000)
x2 <- rnorm(200, mean = 2)
yy <- c(x1, x2)
ss <- initialize_states(num.states = 2, num.samples = length(yy), method = "KmeansFLC", 
    LCs = list(FLCs = yy))
plot(yy, col = ss, pch = 19)
points(x1, col = "blue")



