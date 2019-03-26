## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
rgl::setupKnitr()
library(lidR)

## ------------------------------------------------------------------------
LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las <- readLAS(LASfile)
print(las)

## ------------------------------------------------------------------------
print(las@header)

## ------------------------------------------------------------------------
epsg(las) = 2567
projection(las)

## ------------------------------------------------------------------------
las$Classification <- 0L

## ------------------------------------------------------------------------
las@data$R <- 0

## ---- echo = FALSE-------------------------------------------------------
las@data$R <- NULL

## ------------------------------------------------------------------------
las  <- lasadddata(las, 1:81590, "ID")
las2 <- lasfilter(las, ID > 50000)

## ------------------------------------------------------------------------
las  <- lasaddextrabytes(las, 1:81590, "ID", "An ID for each point")

## ------------------------------------------------------------------------
lascheck(las)

## ----echo = FALSE, rgl=TRUE, dev='png'-----------------------------------
LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las = readLAS(LASfile)
m = structure(c(0.921, -0.146, 0.362, 0, 0.386, 0.482, -0.787, 0, 
-0.06, 0.864, 0.5, 0, 0, 0, 0, 1), .Dim = c(4L, 4L))
plot(las)
rgl::rgl.viewpoint(fov = 50, userMatrix = m)

