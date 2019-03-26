library(palm)


### Name: sim.void
### Title: Simulating points from a void point process.
### Aliases: sim.void

### ** Examples

## Two-dimensional void process.
void.data <- sim.void(c(Dc = 1000, Dp = 10, tau = 0.05), rbind(c(0, 1), c(0, 1)))
## Plotting the data.
plot(void.data$points)
points(void.data$parents, pch = 16, col = "red")




