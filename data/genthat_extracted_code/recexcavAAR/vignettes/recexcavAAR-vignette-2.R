## ---- echo=FALSE---------------------------------------------------------
# check if pandoc is available
if (requireNamespace("rmarkdown") && !rmarkdown::pandoc_available("1.13.1"))
stop("These vignettes assume pandoc version 1.13.1; older versions will not work.")
# see https://r-forge.r-project.org/forum/message.php?msg_id=43797&group_id=234

## ---- message=FALSE------------------------------------------------------
library(devtools)
library(recexcavAAR)
library(kriging)
library(rgl)

## ------------------------------------------------------------------------
edges <- data.frame(
  x = c(6.899, 10.658, 4.428, 0.669, 6.899, 10.658, 4.428, 0.669),
  y = c(19.292, 14.616, 9.597, 14.273, 19.292, 14.616, 9.597, 14.273),
  z = c(9.7, 9.7, 9.7, 9.7, 8.3, 8.3, 8.3, 8.3)
)

## ------------------------------------------------------------------------
rangex <- abs(max(edges$x) - min(edges$x))
rangey <- abs(max(edges$y) - min(edges$y))

edgesordered = rbind(
  edges[1:4, ], 
  edges[1, ], 
  edges[5:8, ], 
  edges[5, ],
  edges[c(6,2), ],
  edges[c(3,7), ],
  edges[c(8,4), ]
)

## ---- echo=FALSE, results="hide"-----------------------------------------
# avoid plotting in X11 window
open3d(useNULL = TRUE)

## ------------------------------------------------------------------------
plot3d(
  edgesordered$x, edgesordered$y, edgesordered$z,
  type="l",
  aspect = c(rangex, rangey, 5),
  xlab = "x", ylab = "y", zlab = "z",
  sub = "Grab me and rotate me!",
  col = "darkgreen"
)

bbox3d(
  xat = c(2, 4, 6, 8, 10),
  yat = c(10, 12, 14, 16, 18),
  zat = c(8.5, 9, 9.5),
  back = "lines"
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
sp <- KT_spits

splist <- list()
spitnames <- c("^surface", "^spit1", "^spit2", "^spit3", "^bottom")

for (i in 1:length(spitnames)){
  splist[[i]] <- sp[grep(spitnames[i], sp$id), ]
}

## ------------------------------------------------------------------------
# I had to choose a very low pixel value to keep the vignette small enough 
maps <- kriglist(splist, x = 2, y = 3, z = 4, lags = 3, model = "spherical", pixels = 30)

surf <- list()
for (i in 1:length(maps)) {
  surf[[i]] <- spatialwide(maps[[i]]$x, maps[[i]]$y, maps[[i]]$pred, digits = 3)
}

idvec <- c()
for (i in 1:length(surf)) {
  idvec[i] <- surface3d(
    surf[[i]]$x, surf[[i]]$y, t(surf[[i]]$z),
    color = c("black", "white"),
    alpha = 0.5,
    add = TRUE
  )
}

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
# remove surfaces from plot
for (i in 1:length(idvec)) {
  rgl.pop(id = idvec[i])
}

## ------------------------------------------------------------------------
for (i in 1:length(maps)) {
  rem <- recexcavAAR::pnpmulti(edges$x[1:4], edges$y[1:4], maps[[i]]$x, maps[[i]]$y)
  maps[[i]] <- maps[[i]][rem, ]
}

surf2 <- list()
for (i in 1:length(maps)) {
  surf2[[i]] <- recexcavAAR::spatialwide(maps[[i]]$x, maps[[i]]$y, maps[[i]]$pred, 3)
}

for (i in 1:length(surf)) {
  surface3d(
    surf2[[i]]$x, surf2[[i]]$y, t(surf2[[i]]$z),
    color = c("black", "white"),
    alpha = 0.5,
    add = TRUE
  )
}

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
ve <- KT_vessel
vesselsingle <- ve[grep("KTF", ve$inv), ]

points3d(
  vesselsingle$x, vesselsingle$y, vesselsingle$z,
  col = "red",
  size = 8, 
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
vesselmass <- ve[grep("KTM", ve$inv), ]

## ------------------------------------------------------------------------
sqc <- KT_squarecorners

squares <- list()
sqnum <- 1
for (i in 1:(nrow(sqc) - 9)) {
  if (i %% 9 == 0) {
    next
  } else {
    a <- sqc[i, ]
    b <- sqc[i + 1, ]
    c <- sqc[i + 9, ]
    d <- sqc[i + 10, ]
  }
  squares[[sqnum]] <- data.frame(
    x = c(a[, 1], b[, 1], c[, 1], d[, 1]), 
    y = c(a[, 2], b[, 2], c[, 2], d[, 2])
  )
  sqnum <- sqnum + 1
}

## ------------------------------------------------------------------------
sqcenters <- recexcavAAR::spitcenternatlist(squares, maps)

for (i in 1:length(sqcenters)) {
  sqcenters[[i]] <- data.frame(sqcenters[[i]], square = i, spit = c("spit1", "spit2", "spit3", "bottom"))
}

sqcdf <- do.call(rbind.data.frame, sqcenters)

## ------------------------------------------------------------------------
completeraster <- points3d(
  sqcdf$x, sqcdf$y, sqcdf$z,
  col = "darkgreen",
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
# remove point raster from plot
rgl.pop(id = completeraster)

## ----warning=FALSE-------------------------------------------------------
vmsq <- merge(vesselmass[, 1:4], sqcdf, by = c("square", "spit"), all.x = TRUE)

vesselm <- vmsq[complete.cases(vmsq), ]

points3d(
  vesselm$x, vesselm$y, vesselm$z,
  col = "orange",
  size = 8, 
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

