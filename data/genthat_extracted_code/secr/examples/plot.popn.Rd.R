library(secr)


### Name: plot.popn
### Title: Plot popn Object
### Aliases: plot.popn
### Keywords: hplot

### ** Examples


temppopn <- sim.popn(D = 5, expand.grid(
    x = c(0,100), y = c(0,100)))
plot(temppopn, pch = 16, col = "blue")

plot(temppopn, circles = 20, bg = "tan", fg =
    "white")
plot(temppopn, pch = 16, cex = 0.5, add = TRUE)




