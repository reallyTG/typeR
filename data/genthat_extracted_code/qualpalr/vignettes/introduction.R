## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----basic_usage---------------------------------------------------------
library(qualpalr)
pal <- qualpal(n = 5, list(h = c(0, 360), s = c(0.4, 0.6), l = c(0.5, 0.85)))

# Adapt the color space to deuteranomaly of severity 0.7
pal <- qualpal(n = 5, colorspace = "pretty", cvd = "deutan", cvd_severity = 0.7)

## ----qualpal_list--------------------------------------------------------
pal

## ----fig.show='hold'-----------------------------------------------------
# Multidimensional scaling plot
plot(pal)

# Pairs plot in the Lab color space
pairs(pal, colorspace = "DIN99d")


## ----map, fig.width=5, fig.height=5--------------------------------------
library(maps)
map("france", fill = TRUE, col = pal$hex, mar = c(0, 0, 0, 0))

## ----details_input, echo=FALSE-------------------------------------------
options(rgl.useNULL = TRUE)
library(rgl)

# Set up color subspace as in qualpal()
h = c(-200, 120)
s = c(0.3, 0.8)
l = c(0.4, 0.9)

# Generate a quasi-random tour sequence
rnd <- randtoolbox::sobol(1000, dim = 3, scrambling = 2)

# Convert random sequence to specified color space
scale_runif <- function(x, new_min, new_max) {
  (new_max - new_min) * (x - 1) + new_max
}

rnd[, 2] <- sqrt(rnd[, 2])
H <- scale_runif(rnd[, 1], min(h), max(h))
S <- scale_runif(rnd[, 2], min(s), max(s))
L <- scale_runif(rnd[, 3], min(l), max(l))
#S <- sqrt(S) # adjust to the fact that we're sampling from a cylinder

HSL <- cbind(H, S, L)
HSL[HSL[, 1] < 0, 1] <- HSL[HSL[, 1] < 0, 1] + 360

# Set up variables to produce the HSL cylinder
x <- S * cos(H * pi / 180)
y <- S * sin(H * pi / 180)

# Convert to RGB to enable coloring
RGB <- qualpalr:::HSL_RGB(HSL)

plot3d(cbind(x, y, L), col = rgb(RGB), main = "HSL")
rglwidget()

## ----RGB_space, echo=FALSE-----------------------------------------------
plot3d(RGB, col = rgb(RGB), main = "RGB")
rglwidget()

## ----DIN_space, echo=FALSE-----------------------------------------------
XYZ    <- qualpalr:::sRGB_XYZ(RGB)
DIN99d <- qualpalr:::XYZ_DIN99d(XYZ)

plot3d(DIN99d, col = rgb(RGB), main = "DIN99d")
rglwidget()

## ----selected_points, echo=FALSE-----------------------------------------
pal <- qualpal(5, list(h = c(-200, 120), s = c(0.3, 0.8), l = c(0.4, 0.9)))
plot3d(DIN99d, col = rgb(RGB), main = "DIN99d", alpha = 0.1)
plot3d(pal$DIN99d, col = pal$hex, main = "DIN99d", add = TRUE, size = 5)
rglwidget()

