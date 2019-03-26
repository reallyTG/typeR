library(StratigrapheR)


### Name: ylink
### Title: Draws connection lines to connect two points in y
### Aliases: ylink

### ** Examples

plot(c(0,6),c(-20,20), type = "n")

infobar(ymin = c(-20,0), ymax = c(0,20), xmin = 1, xmax = 0,
        m = list(col = c("black", "white")))

infobar(ymin = c(-20,10), ymax = c(10,20), xmin = 5, xmax = 6,
        m = list(col = c("black", "white")))

ylink(c(0,12),c(10,20), x1 = 1, x2 = 5, ratio = 0.2,
      l = list(lty = c(1,3), lwd = 2))




