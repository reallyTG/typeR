## ------------------------------------------------------------------------
library(trip)
d <- data.frame(x=1:10,y=rnorm(10), tms=Sys.time() + 1:10, id=gl(2, 5))
coordinates(d) <- ~x+y
## a projection should always be set, is it WGS84 or NAD83 . . .
proj4string(d) <- CRS("+proj=laea +ellps=sphere")
tr <- trip(d, c("tms", "id"))
summary(tr)

## ------------------------------------------------------------------------
plot(tr)
lines(tr)

## ------------------------------------------------------------------------
tg <- rasterize(tr)
plot(tg, col = c("transparent", heat.colors(25)))

## ------------------------------------------------------------------------
data("walrus818")

plot(walrus818, pch = ".")
lines(walrus818)

## ------------------------------------------------------------------------
library(maptools)
library(rgdal)
data(wrld_simpl)
world <- spTransform(subset(wrld_simpl, coordinates(wrld_simpl)[,2] > 0), proj4string(walrus818))
p <- par(xpd = NA, mar = rep(0.5, 4))
plot(walrus818, pch = ".")
plot(world, add = TRUE, col = "grey")
lines(walrus818)
llgridlines(walrus818); par(p)

## ----eval=TRUE-----------------------------------------------------------
library(diveMove)
fname <- system.file(file.path("data", "sealLocs.csv"),
                       package="diveMove")
    dat <- read.table(fname, sep=";", header = TRUE, stringsAsFactors = FALSE)
    dat$class <- ordered(dat$class, c("Z", "B", "A", "0", "1", "2", "3"))
    dat$time <- as.POSIXct(strptime(dat$time, "%Y-%m-%d %H:%M:%S"), tz = "GMT")

locs <- subset(dat, !is.na(dat$lon))
trip(locs) <- c("lon", "lat", "time", "id")
proj4string(locs) <- " +proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0"

## merge with data from argosfilter
library(argosfilter)
data(seal)
seal$id <- "ringy2"
seal[["time"]] <- seal$dtime
seal$dtime <- NULL
## reconstruct the Argos labels
seal[["class"]] <- ordered(levels(dat$class)[factor(seal$lc, sort(unique(seal$lc)))], levels(dat$class))
seal$lc <- NULL


## what are we supposed to do with duplicated times?
##  which(!diff(seal$time) > 0)
##[1]   17  116  122 1008 1158 1231 1293 1300
##plot(seal[which(!diff(seal$time) > 0),c("lon", "lat") ])
##points(seal[1 + which(!diff(seal$time) > 0),c("lon", "lat") ], col = "red")

seal <- seal[!duplicated(seal$time), ]

## drop missing data and combine
dat <- rbind(dat[!is.na(dat$lon), ], seal[,names(dat)])
##coordinates(dat) <- c("lon", "lat")
##proj4string(dat) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")

tr <- dat
trip(dat) <- c("lon", "lat", "time", "id")
proj4string(dat) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")

library(raster)
d2 <- spTransform(dat, projection(walrus818))
plot(union(extent(d2), extent(walrus818)))
lines(d2)
lines(walrus818)
plot(spTransform(subset(wrld_simpl, coordinates(wrld_simpl)[,2] > 0), projection(walrus818)), add = T, col = "grey")


