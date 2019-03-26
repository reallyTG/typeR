library(LICORS)


### Name: compute_LC_coordinates
### Title: Computes coordinates of PLC and FLC relative to origin
### Aliases: compute_LC_coordinates
### Keywords: manip

### ** Examples

plot(compute_LC_coordinates(speed = 1, horizon = 4), xlim = c(-4, 2), pch = "-", 
    cex = 2, col = 2, xlab = "Time", ylab = "Space")
points(compute_LC_coordinates(speed = 1, horizon = 2, type = "FLC"), pch = "+", cex = 2, 
    col = "blue")

plot(compute_LC_coordinates(speed = 1, horizon = 4, shape = "tube", type = "FLC"))
plot(compute_LC_coordinates(speed = 1, horizon = 4, shape = "revcone", type = "PLC"))



