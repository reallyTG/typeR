library(swfscMisc)


### Name: which.nearest
### Title: Which Nearest
### Aliases: which.nearest

### ** Examples

x <- sort(sample(1:100, 20))
y <- sort(sample(min(x):max(x), 5))
i <- which.nearest(x, y)
x
y
x[i]



