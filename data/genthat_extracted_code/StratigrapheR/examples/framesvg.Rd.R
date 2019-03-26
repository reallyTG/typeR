library(StratigrapheR)


### Name: framesvg
### Title: Draws a standardised pointsvg object into a given frame
### Aliases: framesvg

### ** Examples

# Simple use

object <- example.ammonite

xmin <- c(8,7)
xmax <- c(10,9)
ymin <- c(7,6)
ymax <- c(9,8)

plot(c(-10,10), c(-10,10), type = "n")

abline(v = unique(c(xmax, xmin)))
abline(h = unique(c(ymax, ymin)))

framesvg(object, xmin, xmax, ymin, ymax, col = c("white", "grey80"))

# Precision positioning

l <- c(1,2,3)
r <- c(0,1,2)
h  <- c(4,3,4)
i   <- c("B1","B2","B3")

basic.litholog <- litholog(l,r,h,i)

whiteSet(xlim = c(0,4), ylim = c(0,3), ytick = 1, ny = 10)

framesvg(example.lense, 0,3,1,2, forget = "P1", border = "red", lwd = 3)

multigons(basic.litholog$i, basic.litholog$xy, basic.litholog$dt)




