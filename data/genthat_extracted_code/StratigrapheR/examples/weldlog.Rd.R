library(StratigrapheR)


### Name: weldlog
### Title: Changes boundaries segments in basic lithologs
### Aliases: weldlog

### ** Examples

l <- c(0,1,2,3,4)
r <- c(1,2,3,4,5)
h   <- c(4,3,4,3,4)
i <- c("B1","B2","B3","B4","B5")
log  <- litholog(l, r, h, i)

whiteSet(xlim = c(-1,5), ylim = c(-1,6))

multigons(log$i, log$xy, log$dt, lty = 3)

seg1 <- sinpoint(4, 0, 0.25, phase=0.5)
seg2 <- sinpoint(4, 0, 0.25, phase=1.5)

welded <- weldlog(log, dt = c(2,3,4), seg = list(seg1 = seg1, seg2 = seg2),
                  j = c("seg1", "seg2", "seg2"))

multigons(welded$i, welded$xy, welded$dt, lwd = 3, lty = 2, border = "red")




