library(latticeExtra)


### Name: layer
### Title: Add layers to a lattice plot, optionally using a new data source
### Aliases: layer layer_ glayer glayer_ +.trellis drawLayer flattenPanel
###   [.layer print.layer
### Keywords: aplot

### ** Examples

foo <- xyplot(ozone ~ wind, environmental)
foo

## overlay reference lines
foo <- foo + layer(panel.abline(h = 0)) +
             layer(panel.lmline(x, y, lty = 2))

## underlay a flat color
foo <- foo + layer(panel.fill(grey(.95)), under = TRUE)
foo

## layers can access the panel function arguments
foo <- foo + layer({ ok <- (y>100);
            panel.text(x[ok], y[ok], y[ok], pos = 1) })
foo

## over-ride arguments by name
foo <- foo +
  layer(panel.xyplot(y = ave(y, x, FUN = max), type = "a", ...))
foo

## see a sketch of the complete panel function
flattenPanel(foo)


## group layers, drawn for each group in each panel
dotplot(VADeaths, type = "o") +
  glayer(ltext(x[5], y[5], group.value, srt = 40))

## a quick way to print out the panel.groups arguments:
dotplot(VADeaths, type = "o") + glayer(str(list(...)))


## layers with superposed styles
xyplot(ozone ~ wind | equal.count(temperature, 2),
       data = environmental) +
   layer(panel.loess(x, y, span = 0.5), style = 1) +
   layer(panel.loess(x, y, span = 1.0), style = 2) +
   layer(panel.key(c("span = 0.5", "span = 1.0"), corner = c(1,.98),
                   lines = TRUE, points = FALSE), packets = 1)

## note that styles come from the settings in effect in the plot,
## which is not always what you want:
xyplot(1:10 ~ 1:10, type = "b", par.settings = simpleTheme(col = "red")) +
  layer(panel.lines(x = jitter(x, 2), ...)) +  ## drawn in red
  layer(panel.lines(x = jitter(x, 2), ...), force = TRUE)  ## reset theme


## using other variables from the original `data` object
## NOTE: need subscripts = TRUE in original call!
zoip <- xyplot(wind ~ temperature | equal.count(radiation, 2),
   data = environmental, subscripts = TRUE)
zoip + layer(panel.points(..., pch = 19,
             col = grey(1 - ozone[subscripts] / max(ozone))),
       data = environmental)


## restrict drawing to specified panels
barchart(yield ~ variety | site, data = barley,
         groups = year, layout = c(1,6), as.table = TRUE,
         scales = list(x = list(rot = 45))) +
layer(ltext(tapply(y, x, max), lab = abbreviate(levels(x)),
      pos = 3), rows = 1)


## example of a new data source
qua <- xyplot(lat ~ long | cut(depth, 2), quakes,
    aspect = "iso", pch = ".", cex = 2)
qua
## add layer showing distance from Auckland
newdat <- with(quakes, expand.grid(
            gridlat = seq(min(lat), max(lat), length = 60),
            gridlon = seq(min(long), max(long), length = 60)))
newdat$dist <- with(newdat, sqrt((gridlat - -36.87)^2 +
                                 (gridlon - 174.75)^2))
qua + layer_(panel.contourplot(x = gridlon, y = gridlat, z = dist,
   contour = TRUE, subscripts = TRUE), data = newdat)



