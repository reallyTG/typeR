## ---- echo=FALSE---------------------------------------------------------
# check if pandoc is available
if (requireNamespace("rmarkdown") && !rmarkdown::pandoc_available("1.13.1"))
stop("These vignettes assume pandoc version 1.13.1; older versions will not work.")
# see https://r-forge.r-project.org/forum/message.php?msg_id=43797&group_id=234

## ---- message=FALSE------------------------------------------------------
library(devtools)
library(recexcavAAR)
library(dplyr)
library(kriging)
library(magrittr)
library(rgl)

## ------------------------------------------------------------------------
edges <- data.frame(
  x = c(0, 3, 0, 3, 0, 3, 0, 3),
  y = c(0, 0, 0, 0, 1, 1, 1, 1),
  z = c(0, 0, 2, 2, 0, 0, 2, 2)
)

## ---- echo=FALSE, results="hide"-----------------------------------------
# avoid plotting in X11 window
open3d(useNULL = TRUE)

## ------------------------------------------------------------------------
plot3d(
  edges$x, edges$y, edges$z,
  type="s",
  aspect = c(3, 1, 2),
  xlab = "x", ylab = "y", zlab = "z",
  sub = "Grab me and rotate me!"
)

bbox3d(
  xat = c(0, 1, 2, 3),
  yat = c(0, 0.5, 1),
  zat = c(0, 0.5, 1, 1.5, 2),
  back = "lines"
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
df1 <- data.frame(
  x = c(rep(0, 6), seq(0.2, 2.8, 0.2), seq(0.2, 2.8, 0.2), rep(3,6)),
  y = c(seq(0, 1, 0.2), rep(0, 14), rep(1, 14), seq(0, 1, 0.2)), 
  z = c(seq(0.95, 1.2, 0.05), 0.9+0.05*rnorm(14), 1.3+0.05*rnorm(14), seq(0.95, 1.2, 0.05))
)

df2 <- data.frame(
  x = c(rep(0, 6), seq(0.2, 2.8, 0.2), seq(0.2, 2.8, 0.2), rep(3,6)),
  y = c(seq(0, 1, 0.2), rep(0, 14), rep(1, 14), seq(0, 1, 0.2)),
  z = c(seq(0.65, 0.9, 0.05), 0.6+0.05*rnorm(14), 1.0+0.05*rnorm(14), seq(0.65, 0.9, 0.05))
)

## ------------------------------------------------------------------------
points3d(
  df1$x, df1$y, df1$z,
  col = "darkgreen",
  add = TRUE
)

points3d(
  df2$x, df2$y, df2$z,
  col = "blue",
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
lpoints <- list(df1, df2)

maps <- kriglist(lpoints, lags = 3, model = "spherical", pixels = 30)

## ------------------------------------------------------------------------
surf1 <- spatialwide(maps[[1]]$x, maps[[1]]$y, maps[[1]]$pred, 3)
surf2 <- spatialwide(maps[[2]]$x, maps[[2]]$y, maps[[2]]$pred, 3)

## ------------------------------------------------------------------------
surface3d(
  surf1$x, surf1$y, t(surf1$z),
  color = c("black", "white"),
  alpha = 0.5,
  add = TRUE
)

surface3d(
  surf2$x, surf2$y, t(surf2$z),
  color = c("black", "white"),
  alpha = 0.5,
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ----fig.width=7, fig.height=5-------------------------------------------
hexatestdf <- data.frame(
  x = c(1, 1, 1, 1, 2, 2, 2, 2),
  y = c(0, 1, 0, 1, 0, 1, 0, 1),
  z = c(0.8, 0.8, 1, 1, 0.8, 0.8, 1, 1)
)

## ------------------------------------------------------------------------
cx = fillhexa(hexatestdf, 0.1)

## ------------------------------------------------------------------------
completeraster <- points3d(
  cx$x, cx$y, cx$z,
  col = "red",
  add = TRUE
)


## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

# remove point raster from plot
rgl.pop(id = completeraster)

## ------------------------------------------------------------------------
cuberasterlist <- list(cx)

crlist <- posdeclist(cuberasterlist, maps)

hexa <- crlist[[1]]

a <- filter(
  hexa,
  pos == 0
)

b <- filter(
  hexa,
  pos == 1
)

c <- filter(
  hexa,
  pos == 2
)

points3d(
  a$x, a$y, a$z,
  col = "red",
  add = TRUE
)

points3d(
  b$x, b$y, b$z,
  col = "blue",
  add = TRUE
)

points3d(
  c$x, c$y, c$z,
  col = "green",
  add = TRUE
)

## ---- echo=FALSE, fig.width=7, fig.height=5------------------------------
rglwidget()

## ------------------------------------------------------------------------
sapply(
  crlist, 
  function(x){
    x$pos %>%
    table() %>%
    prop.table() %>%
    multiply_by(100) %>%
    round(2)
  }
  ) %>% t

