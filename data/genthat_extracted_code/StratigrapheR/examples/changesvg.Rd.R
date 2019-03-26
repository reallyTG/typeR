library(StratigrapheR)


### Name: changesvg
### Title: Changes a pointsvg object
### Aliases: changesvg

### ** Examples

object1 <- example.lense

opar <- par("mfrow")
par(mfrow = c(1,3))

plot(c(-1,1), c(-1,1), type = "n")
placesvg(object1)

plot(c(-1,1), c(-1,1), type = "n")
object2 <- changesvg(object1, forget = 1)
placesvg(object2)

plot(c(-1,1), c(-1,1), type = "n")
object3 <- changesvg(object1, forget = "P1", standard = TRUE)
placesvg(object3)

par(mfrow = opar)




