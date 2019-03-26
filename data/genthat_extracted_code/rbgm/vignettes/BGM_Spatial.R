## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(raster)
library(dplyr)
library(rgdal)
library(sp)

## ------------------------------------------------------------------------
library(rbgm)
library(scales)  ## for alpha function
library(bgmfiles) ## example files
## example data set in package
fname <- bgmfiles(pattern = "Nordic")[1L]
bgm <- bgmfile(fname)
plot(boxSpatial(bgm), col = grey(seq(0, 1, length = nrow(bgm$boxes))))

## ------------------------------------------------------------------------
print(names(bgm))

## ------------------------------------------------------------------------
(spdf <- boxSpatial(bgm))

(sldf <- faceSpatial(bgm))

## ------------------------------------------------------------------------
subset(spdf, horizmix == 0, select = label)

plot(boxSpatial(bgm), col = grey(seq(0, 1, length = nrow(bgm$boxes)), alpha = 0.5))

text(coordinates(spdf), labels = spdf$label, col = grey(seq(1, 0, length = nrow(bgm$boxes))), cex = 0.8)

## ------------------------------------------------------------------------
## subset the boundary boxes
plot(subset(spdf, boundary), border = "firebrick", lwd = 3)

## or just get a single boundary for the inner
plot(boundarySpatial(bgm), border = alpha("dodgerblue", 0.3), lwd = 7, add = TRUE)

## ------------------------------------------------------------------------
plot(boxSpatial(bgm), col = grey(seq(0, 1, length = nrow(bgm$boxes)), alpha = 0.5))


plot(sldf, col = rainbow(nrow(sldf)), lwd = 2,  add = TRUE)
text(do.call(rbind, lapply(coordinates(sldf), function(x) apply(x[[1]], 2, mean))), 
     labels = gsub("ace", "", sldf$label), cex = 0.5, col = rainbow(nrow(sldf)), pos = 3)

## ------------------------------------------------------------------------
plot(boundarySpatial(bgm), lwd = 4, col = "grey")
plot(boxSpatial(bgm), add = TRUE)

