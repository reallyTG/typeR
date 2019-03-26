library(TLMoments)


### Name: as.PWMs
### Title: Convert to PWMs-object
### Aliases: as.PWMs as.PWMs.numeric as.PWMs.matrix as.PWMs.list
###   as.PWMs.data.frame

### ** Examples

xmat <- cbind(c(0.12, .41, .38, .33), c(.05, 0.28, .25, .22))
xvec <- xmat[, 1]
xlist <- lapply(1:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = letters[1:3],
 season = c("S", "W", "S"),
 b0 = c(.12, .15, .05),
 b1 = c(.41, .33, .28),
 b2 = c(.38, .18, .25)
)

as.PWMs(xvec)
as.PWMs(xvec[-2], order = c(0, 2, 3))

as.PWMs(xmat)
as.PWMs(xmat[-2, ], order = c(0, 2, 3))

as.PWMs(xlist)

as.PWMs(xdat, cbind(b0, b1, b2) ~ station)
as.PWMs(xdat, . ~ station + season)
as.PWMs(xdat, cbind(b0, b2) ~ station, order = c(0, 2))

p <- as.PWMs(xdat, cbind(b0, b1, b2) ~ station)
TLMoments(p)

(p <- as.PWMs(xdat, cbind(b0, b1) ~ station))
#parameters(TLMoments(p), "gev") # => error
#parameters(TLMoments(p), "gpd") # => error
parameters(TLMoments(p), "gpd", u = 10)

(p <- as.PWMs(xdat, cbind(b0, b2) ~ station, order = c(0, 2)))
#TLMoments(p) # => error




