library(StratigrapheR)


### Name: shift
### Title: Circular shift
### Aliases: shift

### ** Examples

# Simple use

shift(x = c(6,8,10,12,2,4), n = 2)

# Applications to litholog generation

l <- c(1,2,3)
r <- c(0,1,2)
h  <- c(4,3,4)
i   <- c("B1","B2","B3")

basic.litholog <- litholog(l,r,h,i)

whiteSet(xlim = c(0,4), ylim = c(0,3),
         xaxs = "r", yaxs = "r",   # This gives a little room to the graph
         ytick = 1, ny = 10)

multigons(basic.litholog$i, basic.litholog$xy, basic.litholog$dt,
          forget = "B1", lwd = 2)

openbed <- subset(basic.litholog, basic.litholog == "B1")

openbed <- shift(openbed, -1)

lines(openbed$xy, openbed$dt, lwd = 2)




