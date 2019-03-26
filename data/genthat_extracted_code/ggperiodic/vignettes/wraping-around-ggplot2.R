## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
x <- seq(0, 360 - 10, by = 10)*pi/180
y <- seq(-90, 90, by = 10)*pi/180

Z <- expand.grid(x = x, y = y)
Z$z <- with(Z, 1.2*sin(x)*0.4*sin(y*2) - 
               0.5*cos(2*x)*0.5*sin(3*y) + 
               0.2*sin(4*x)*0.45*cos(2*x))
Z$x <- Z$x*180/pi
Z$y <- Z$y*180/pi

## ------------------------------------------------------------------------
library(ggplot2)
ggplot(Z) +
  geom_contour(aes(x, y, z = z, color = ..level..)) +
  coord_polar()

## ------------------------------------------------------------------------
library(ggperiodic)
Z <- periodic(Z, x = c(0, 360))
head(Z)

## ------------------------------------------------------------------------
wrapped_z <- wrap(Z, x = c(-180, 180))
range(wrapped_z$x)

## ------------------------------------------------------------------------
ggplot(Z) +
  geom_contour(aes(x, y, z = z, color = ..level..)) +
  coord_polar()

## ------------------------------------------------------------------------
ggplot(Z, x = c(0, 360)*3) +
  geom_contour(aes(x, y, z = z, color = ..level..))

