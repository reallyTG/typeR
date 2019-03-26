## ------------------------------------------------------------------------
library(Polychrome)

## ------------------------------------------------------------------------
mypal <- kelly.colors(22)

## ----fig.width=7, fig.height=5-------------------------------------------
swatch(mypal)

## ----fig.width=7, fig.height=5-------------------------------------------
swatchHue(mypal)

## ----fig.width=7, fig.height=5-------------------------------------------
swatchLuminance(mypal)

## ----fig.width=7, fig.height=5-------------------------------------------
ranswatch(mypal)

## ----fig.width=7, fig.height=5-------------------------------------------
pal2 <- alphabet.colors(26)
ranpoints(pal2, 14)

## ----fig.width=7, fig.height=5-------------------------------------------
uvscatter(pal2)

## ----fig.width=7, fig.height=5-------------------------------------------
luminance(pal2)

## ----fig.width=7, fig.height=5-------------------------------------------
rancurves(pal2)

## ----fig.width=7, fig.height=5-------------------------------------------
plothc(pal2)

## ----fig.width=7, fig.height=5-------------------------------------------
plotpc(pal2)

## ----fig.width=7, fig.height=5-------------------------------------------
grayed <- colorspace::desaturate(pal2)
swatchLuminance(grayed)

