## ------------------------------------------------------------------------
library(nhstplot)

## ------------------------------------------------------------------------
plotchisqtest(chisq = 8, df = 4)

## ------------------------------------------------------------------------
plotftest(f = 4, dfnum = 3, dfdenom = 5)

## ------------------------------------------------------------------------
plotttest(t = 2, df = 10)

## ------------------------------------------------------------------------
plotttest(2, 10, tails = "one")

## ------------------------------------------------------------------------
plotttest(-2, 10, tails = "one")

## ------------------------------------------------------------------------
plotztest(z = 2)

## ------------------------------------------------------------------------
plotztest(2, tails = "one")

## ------------------------------------------------------------------------
plotztest(-2, tails = "one")

## ------------------------------------------------------------------------
plotztest(-2, blank = TRUE)

## ------------------------------------------------------------------------
plotztest(2, theme = "blackandwhite")
plotztest(2, theme = "whiteandred")
plotztest(2, theme = "blueandred")
plotztest(2, theme = "greenandred")
plotztest(2, theme = "goldandblue")

## ------------------------------------------------------------------------
plotftest(4, 3, 5, colorleft = "lightgreen", colorleftcurve = "red", colorright = "indianred", colorrightcurve = "blue", colorplabel = "darkgrey", colorcut = "#FFA500")

## ------------------------------------------------------------------------
plotztest(2, colormiddle = "lightgreen", colormiddlecurve = "red", colorsides = "indianred", colorsidescurve = "blue", colorplabel = "darkgrey", colorcut = "#FFA500")

## ------------------------------------------------------------------------
plotztest(2, fontfamily = "Helvetica")

## ------------------------------------------------------------------------
plotztest(2, cutlinesize = 2, curvelinesize = 1)

## ------------------------------------------------------------------------
plotztest(2.134553, signifdigitsp = 2, signifdigitsz = 2)

