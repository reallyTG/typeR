## ----opts,echo=FALSE-----------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5)

## ----lib-----------------------------------------------------------------
library(Polychrome)

## ----args----------------------------------------------------------------
args(createPalette)

## ----first10-------------------------------------------------------------
set.seed(723451) # for reproducibility
firstpal <- createPalette(10, c("#010101", "#ff0000"), M=1000)
firstpal

## ----firstswatch, fig.cap="First palette"--------------------------------
swatch(firstpal)

## ----second, fig.cap="A pallete from a single black seed."---------------
set.seed(723451) # for reproducibility
second <- createPalette(10, c("#010101"), M=1000)
swatch(second)

## ----third, fig.cap="A palette from a single red seed."------------------
set.seed(723451) # for reproducibility
third <- createPalette(10, c("#ff0000"), M=1000)
swatch(third)

## ----fourth, fig.cap="A blue and green seeded palette."------------------
set.seed(723451) # for reproducibility
fourth <- createPalette(10, c("#00ff00", "#0000ff"), M=1000)
swatch(fourth)

## ----fifth, fig.cap="A CMY seeded palete."-------------------------------
set.seed(723451) # for reproducibility
fifth <- createPalette(10, c("#00ffff", "#ff00ff", "#ffff00"), M=1000)
swatch(fifth)

## ----luv36---------------------------------------------------------------
library(colorspace)
p36 <- palette36.colors(36)
luvmat <- as(hex2RGB(p36), "LUV")
y <- luvmat@coords

## ----hull, fig.width=6,fig.height=6,fig.cap="The convex hull of the UV coordinates of the 36-color palette."----
hull <- y[chull(y[,2], y[,3]), 2:3]
uvscatter(p36)
polygon(hull[,1], hull[,2], lwd=2)

## ----area----------------------------------------------------------------
hullaug <- rbind(hull, hull[1,])
N <- nrow(hullaug)
fst <-sum(hullaug[1:(N-1), 1]*hullaug[2:N, 2] )
snd <- sum(hullaug[2:N, 1]*hullaug[1:(N-1), 2] )
area <- (snd - fst)/2
area

## ----uppervol------------------------------------------------------------
overvol <- 100*area
overvol

## ----volsphere-----------------------------------------------------------
sphere <- 4/3*pi*20^3
sphere

## ----fat-----------------------------------------------------------------
100 * area/sphere *0.74

60 * area/sphere *0.74

## ----what----------------------------------------------------------------
L <- 0:100
U <- -60:150
V <- -150:150
luv <- cbind(L = rep(L, length(U)*length(V)),
             U = rep(rep(U, each=length(L)), times=length(V)),
             V = rep(V, each=length(L)*length(U)))*1.0

## ----hexify--------------------------------------------------------------
tested <- LUV(luv)
co <- tested@coords

## ------------------------------------------------------------------------
he <- hex(tested)
summary(is.na(he))
mean(!is.na(he))

## ------------------------------------------------------------------------
VOL <- diff(range(L)) * diff(range(U)) * diff(range(V)) * 0.205
VOL
VOL/sphere * 0.74

## ----final---------------------------------------------------------------
VOL/sphere

## ----last10, fig.cap="Palette with more candidate colors."---------------
set.seed(723451) # for reproducibility
lastpal <- createPalette(10, c("#010101", "#ff0000"), M=10000)
lastpal
swatch(firstpal)
swatch(lastpal)

