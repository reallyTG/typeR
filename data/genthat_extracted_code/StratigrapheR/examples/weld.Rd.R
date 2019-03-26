library(StratigrapheR)


### Name: weld
### Title: Combines segments with "litholog()"-like data frame
### Aliases: weld

### ** Examples

l <- c(1)
r <- c(2)
h <- c(4)
i <- c("B1")
log <- litholog(l, r, h, i)

seg <- sinpoint(4, 1, 0.25, pos = 2, phase = 0.5)
welded <- weld(log, seg$y, seg$x, 3, 4, order = "inverse", erase = "both")

plot(c(-1,5),c(0,3),type = "n")

multigons(log$i,log$xy,log$dt)
points(seg$x,seg$y)

multigons(welded$i, welded$xy, welded$dt, lty = 2, lwd = 3, border = "red")




