library(inlmisc)


### Name: GetInsetLocation
### Title: Get Location for Inset in Plot
### Aliases: GetInsetLocation
### Keywords: hplot

### ** Examples

plot(NA, NA, xlim = c(0, 100), ylim = c(0, 1),
     xlab = "x", ylab = "y", xaxs = "i", yaxs = "i")
dx <- 20; dy <- 0.2
xy <- GetInsetLocation(dx, dy, loc = "bottomleft")
rect(xy[1], xy[2], xy[1] + dx, xy[2] + dy, border = "red")
points(xy[1], xy[2], pch = 16, xpd = TRUE)
print(xy)

xy <- GetInsetLocation(dx, dy, loc = "bottomleft", inset = 0.05)
rect(xy[1], xy[2], xy[1] + dx, xy[2] + dy, border = "pink")
points(xy[1], xy[2], pch = 16)
print(xy)

xy <- GetInsetLocation(dx, dy, loc = "topright", padin = 0.5)
rect(xy[1], xy[2], xy[1] + dx, xy[2] + dy, border = "blue")

xy <- GetInsetLocation(dx, dy, loc = "left", pad = c(5, 0))
rect(xy[1], xy[2], xy[1] + dx, xy[2] + dy, border = "green")

xy <- GetInsetLocation(dx, dy, loc = "center")
rect(xy[1], xy[2], xy[1] + dx, xy[2] + dy, border = "brown")




