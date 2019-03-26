library(trip)


### Name: cut.trip
### Title: Split trip events into exact time-based boundaries.
### Aliases: cut.trip
### Keywords: chron manip

### ** Examples


## Not run: 
##D set.seed(66)
##D d <- data.frame(x=1:100, y=rnorm(100, 1, 10),
##D                 tms= as.POSIXct(as.character(Sys.time()), tz = "GMT") + c(seq(10, 1000, length=50),
##D                 seq(100, 1500, length=50)), id=gl(2, 50))
##D coordinates(d) <- ~x+y
##D tr <- trip(d, c("tms", "id"))
##D 
##D cut(tr, "200 sec")
##D 
##D bound.dates <- seq(min(tr$tms) - 1, max(tr$tms) + 1, length=5)
##D trip.list <- cut(tr, bound.dates)
##D bb <- bbox(tr)
##D cn <- c(20, 8)
##D g <- GridTopology(bb[, 1], apply(bb, 1, diff) / (cn - 1), cn)
##D 
##D tg <- tripGrid(tr, grid=g)
##D tg <- as.image.SpatialGridDataFrame(tg)
##D tg$x <- tg$x - diff(tg$x[1:2]) / 2
##D tg$y <- tg$y - diff(tg$y[1:2]) / 2
##D 
##D op <- par(mfcol=c(4, 1))
##D for (i in 1:length(trip.list)) {
##D   plot(coordinates(tr), pch=16, cex=0.7)
##D   title(names(trip.list)[i], cex.main=0.9)
##D   lines(trip.list[[i]])
##D   abline(h=tg$y, v=tg$x, col="grey")
##D   image(tripGrid(trip.list[[i]], grid=g), interpolate=FALSE,
##D   col=c("white", grey(seq(0.2, 0.7,  length=256))),add=TRUE)
##D   abline(h=tg$y, v=tg$x,  col="grey")
##D   lines(trip.list[[i]])
##D   points(trip.list[[i]], pch=16, cex=0.7)
##D }
##D 
##D par(op)
##D print("you may need to resize the window to see the grid data")
##D 
##D cn <- c(200, 80)
##D g <- GridTopology(bb[, 1], apply(bb, 1, diff) / (cn - 1), cn)
##D 
##D tg <- tripGrid(tr, grid=g)
##D tg <- as.image.SpatialGridDataFrame(tg)
##D tg$x <- tg$x - diff(tg$x[1:2]) / 2
##D tg$y <- tg$y - diff(tg$y[1:2]) / 2
##D 
##D op <- par(mfcol=c(4, 1))
##D for (i in 1:length(trip.list)) {
##D   plot(coordinates(tr), pch=16, cex=0.7)
##D   title(names(trip.list)[i], cex.main=0.9)
##D   image(tripGrid(trip.list[[i]], grid=g, method="density", sigma=1),
##D         interpolate=FALSE,
##D         col=c("white", grey(seq(0.2, 0.7, length=256))),
##D         add=TRUE)
##D   lines(trip.list[[i]])
##D   points(trip.list[[i]], pch=16, cex=0.7)
##D }
##D 
##D par(op)
##D print("you may need to resize the window to see the grid data")
##D 
## End(Not run)




