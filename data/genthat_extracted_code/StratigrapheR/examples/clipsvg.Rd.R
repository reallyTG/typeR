library(StratigrapheR)


### Name: clipsvg
### Title: Clips a standardised pointsvg object into a given frame
### Aliases: clipsvg

### ** Examples

# Simple use

object <- example.ammonite

plot(c(-1,1), c(-1,1), type = "n", ylab = "y", xlab = "x")

res.object <- clipsvg(object, xmax = 0.5)

abline(v = 0.5)

centresvg(object, 0, 0, lty = 2)
centresvg(res.object, 0, 0, col = "red", lwd = 2)

# Advanced used

object2 <- example.breccia

plot(c(-1,3), c(-1,11), type = "n", ylab = "y", xlab = "x")

object2replicated <- framesvg(object2, 0,2,c(0,4,8), c(2,6,10),
                              output = TRUE)

object2clipped    <- clipsvg(object2replicated, 0, 1.7, 1, 9)

rect(0, 1, 1.7, 9, border = "red")

placesvg(object2clipped, border = "red", lwd = 2)




