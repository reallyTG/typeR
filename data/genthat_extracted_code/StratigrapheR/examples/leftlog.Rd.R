library(StratigrapheR)


### Name: leftlog
### Title: Finds bed intervals in a "litholog()"-like data frame
### Aliases: leftlog

### ** Examples

l <- c(0,1,2,3,4)
r <- c(1,2,3,4,5)
h   <- c(4,3,4,3,4)
i <- c("B1","B2","B3","B4","B5")
log  <- litholog(l, r, h, i)

whiteSet(xlim = c(-1,5), ylim = c(-1,6))

title("leftlog() gets the bed names in the right position")

multigons(log$i, log$xy, log$dt, lty = 3)

seg1 <- sinpoint(4, 0, 0.25, pos = 1, phase=0)
seg2 <- sinpoint(4, 0, 0.25, pos = 1, phase=1)

welded <- weldlog(log, dt = c(2,3), seg = list(seg1, seg2), add.dt = 0.5)

multigons(welded$i, welded$xy, welded$dt, lwd = 3, lty = 2, border = "red")

old.log.interval <- leftlog(log$i, log$dt, log$xy)
new.log.interval <- leftlog(welded$i, welded$dt, welded$xy)

bedtext(labels = new.log.interval$id,
        l= new.log.interval$l,
        r= new.log.interval$r,
        arg = list(col = "red"))




