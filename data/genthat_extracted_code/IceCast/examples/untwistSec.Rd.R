library(IceCast)


### Name: untwistSec
### Title: Remove self-intersections from one section of a contour
### Aliases: untwistSec

### ** Examples

par(mfrow = c(1, 2))
plot(currSecEx, type = "l", main = "Original Line Section", xlab = "", ylab = "")
newSec <- untwistSec(currSecEx)
plot(newSec, type = "l", main = "New Line Section", xlab = "", ylab =  "")



