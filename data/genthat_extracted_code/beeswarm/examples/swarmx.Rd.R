library(beeswarm)


### Name: swarmx
### Title: Adjust 1-d data to separate coincident points
### Aliases: swarmx swarmy
### Keywords: dplot

### ** Examples
 

## Plot points in one dimension
index <- rep(0, 100)
values <- rnorm(100)
plot(index, values, xlim = c(-0.5, 2.5))
points(swarmx(index + 1, values), col = 2)
points(swarmx(index + 2, values, cex = 1.5), col = 3, cex = 1.5)

## Try the horizontal direction, with a log scale
plot(values, index, log = "x", ylim = c(-1, 2))
points(swarmy(values, index + 1), col = 2)

## Newer examples using "side" and "priority"
plot(c(-0.5, 3.5), range(values), type = 'n')
points(swarmx(index + 0, values), col = 1)
points(swarmx(index + 0.9, values, side = -1), col = 2)
points(swarmx(index + 1.1, values, side =  1, priority = "descending"), col = 3)
points(swarmx(index + 2  , values, priority = 'density'), col = 4)
points(swarmx(index + 3  , values, priority = 'random'), col = 5)




