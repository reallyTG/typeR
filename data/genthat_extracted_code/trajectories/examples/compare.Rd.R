library(trajectories)


### Name: compare
### Title: Compares objects of class 'Track'
### Aliases: compare compare,Track-method
### Keywords: compare

### ** Examples

## example tracks
library(sp)
library(xts)
data(A3)
track2 <- A3
index(track2@time) <- index(track2@time) + 32
track2@sp@coords <- track2@sp@coords + 0.003

## compare and plot
difftrack <- compare(A3, track2)
plot(difftrack)



