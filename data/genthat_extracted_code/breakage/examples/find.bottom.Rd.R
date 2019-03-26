library(breakage)


### Name: find.bottom
### Title: Identify the bottom points in a hopping-mode position trace
### Aliases: find.bottom

### ** Examples

# use a simple sine wave as an example signal
t <- 1:1000
hops <- sin(t * pi/100)

# find the bottom points
bots <- find.bottom(hops)

# plot the result
plot(hops, type="l")
abline(v=t[bots], col=2)



