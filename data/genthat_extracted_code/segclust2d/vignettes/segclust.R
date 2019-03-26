## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  fig.width = 8,
  fig.height = 5,
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  install.packages("segclust2d")

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  devtools::install_github("rpatin/segclust2d")

## ---- fig.show='hold'----------------------------------------------------
library(segclust2d)
data(simulshift)

## ---- fig.show='hold'----------------------------------------------------
shift_seg <- segmentation(simulshift, lmin = 300, Kmax = 25, type = "home-range", subsample_by = 60)

## ---- fig.show='hold'----------------------------------------------------
plot(shift_seg)

## ---- fig.show='hold'----------------------------------------------------
plot(shift_seg, nseg = 10)

## ---- fig.show='hold'----------------------------------------------------
plot_likelihood(shift_seg)

## ---- fig.show='hold'----------------------------------------------------
data(simulmode)
simulmode$abs_spatial_angle <- abs(simulmode$spatial_angle)
simulmode <- simulmode[!is.na(simulmode$abs_spatial_angle), ]

## ---- fig.show='hold'----------------------------------------------------
mode_segclust <- segclust(simulmode, Kmax = 20, lmin=10, ncluster = c(2,3), type = "behavior", seg.var = c("speed","abs_spatial_angle"))


## ---- fig.show='hold'----------------------------------------------------
plot(mode_segclust)

## ---- fig.show='hold'----------------------------------------------------
plot(mode_segclust, ncluster = 3)
plot(mode_segclust, ncluster = 3, nseg = 7)


## ---- fig.show='hold'----------------------------------------------------
plot_BIC(mode_segclust)

## ---- fig.show='hold', results = "hide"----------------------------------
augment(shift_seg)
augment(mode_segclust)

## ---- fig.show='hold', results = "hide"----------------------------------
augment(shift_seg, nseg = 10) # segmentation()
augment(mode_segclust, ncluster = 2) # segclust()
augment(mode_segclust, ncluster = 2, nseg = 5) # segclust()

## ---- fig.show='hold', results = "hide"----------------------------------
segment(shift_seg)
segment(shift_seg, nseg = 3)
segment(mode_segclust)
segment(mode_segclust, nclust = 3, nseg = 8)

## ---- fig.show='hold', results = "hide"----------------------------------
states(shift_seg)
states(shift_seg, nseg = 3)
states(mode_segclust)
states(mode_segclust, nclust = 3, nseg = 8)

## ---- fig.show='hold', results = "hide"----------------------------------
logLik(shift_seg)
logLik(mode_segclust)

## ---- fig.show='hold', results = "hide"----------------------------------
BIC(mode_segclust)

## ---- fig.show='hold'----------------------------------------------------
plot(shift_seg)
plot(mode_segclust, ncluster = 3, nseg = 10, xcol = "indice", order = T)

## ---- fig.show='hold'----------------------------------------------------
segmap(shift_seg, nseg = 10)
segmap(mode_segclust, ncluster = 3, nseg = 10)

## ---- fig.show='hold'----------------------------------------------------
stateplot(shift_seg, nseg = 10)
stateplot(mode_segclust, ncluster = 3, nseg = 10)

## ---- fig.show='hold'----------------------------------------------------
plot_likelihood(shift_seg)
plot_likelihood(mode_segclust)

## ---- fig.show='hold'----------------------------------------------------
plot_BIC(mode_segclust)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  mode_segclust <- segclust(simulmode, Kmax = 30, lmin=5, ncluster = c(2,3,4), type = "behavior", seg.var = c("speed","abs_spatial_angle"), subsample = FALSE)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  mode_segclust <- segclust(simulmode, Kmax = 30, lmin=5, ncluster = c(2,3,4), type = "behavior", seg.var = c("speed","abs_spatial_angle"), subsample_over = 1000)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  mode_segclust <- segclust(simulmode, Kmax = 30, lmin=5, ncluster = c(2,3,4), type = "behavior", seg.var = c("speed","abs_spatial_angle"), subsample_by = 2)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  segmentation(ltraj_object, lmin = 5, Kmax = 25)
#  segmentation(Move_object, lmin = 5, Kmax = 25)

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  segmentation(ltraj_object, lmin = 5, Kmax = 25, ncluster = c(2,3), seg.var = c("speed","abs_spatial_angle"))
#  segmentation(Move_object, lmin = 5, Kmax = 25, ncluster = c(2,3), seg.var = c("speed","abs_spatial_angle"))

## ---- fig.show='hold', eval = FALSE--------------------------------------
#  simple_data <- simulmode[,c("dateTime","x","y")]
#  full_data   <- add_covariates(simple_data, coord.names = c("x","y"), timecol = "dateTime",smoothed = TRUE, units ="min")
#  head(full_data)

