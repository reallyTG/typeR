library(fastmaRching)


### Name: gridFastMarch
### Title: Runs the grid version of the Modified Fast Marching Method
### Aliases: gridFastMarch

### ** Examples

# Single process
grid <- matrix(1,10,10)
seed <- c(5,5,0,1)
fm <- gridFastMarch(grid, seed)
image(fm$arrival.time)

# Two processes with same incept time
seeds <- cbind(c(7,7,0,1),c(2,2,0,1))
fm2 <- gridFastMarch(grid, seeds)
par(mfrow=c(1,3))
image(fm2$process, main='process')
image(fm2$arrival.time, main='arrival time')
image(fm2$cost.distance, main='distance')

# Same as before but changing spatial.res parameter
fm3 <- gridFastMarch(grid, seeds, spatial.res=10)

# Same as before but with a barrier in middle
grid[5,2:9] <- 0
fm4 <- gridFastMarch(grid, seeds, spatial.res=10)
par(mfrow=c(1,3))
image(fm4$process, main='process')
image(fm4$arrival.time, main='arrival time')
image(fm4$cost.distance, main='distance')

# Same as before but with different incept times and speeds
seeds <- cbind(c(7,7,0,1),c(2,2,1,0.5))
fm5 <- gridFastMarch(grid, seeds, spatial.res=10)
par(mfrow=c(1,3))
image(fm5$process, main='process')
image(fm5$arrival.time, main='arrival time')
image(fm5$cost.distance, main='distance')



