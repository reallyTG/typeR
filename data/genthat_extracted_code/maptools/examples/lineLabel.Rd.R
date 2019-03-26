library(maptools)


### Name: lineLabel
### Title: Line label placement with spplot and lattice.
### Aliases: lineLabel sp.lineLabel label sp.lineLabel-methods
###   label-methods sp.lineLabel,Lines-method
###   sp.lineLabel,SpatialLines-method label,SpatialLines-method

### ** Examples

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE

data(meuse)
coordinates(meuse) = ~x+y
data(meuse.riv)
meuse.sl <- SpatialLines(list(Lines(list(Line(meuse.riv)), "1")))

library(RColorBrewer)
myCols <- adjustcolor(colorRampPalette(brewer.pal(n=9, 'Reds'))(100), .85)

labs <- label(meuse.sl, 'Meuse River')

## Maximum depth
sl1 <- list('sp.lineLabel', meuse.sl, label=labs,
            position='below', textloc='maxDepth',
            spar=.2,
            col='darkblue', cex=1,
            fontfamily='Palatino',
            fontface=2)

spplot(meuse.grid["dist"],
       col.regions=myCols, 
       sp.layout = sl1)

## Constant slope
sl2 <- modifyList(sl1, list(textloc = 'constantSlope')) ## Default

spplot(meuse.grid["dist"],
       col.regions=myCols, 
       sp.layout = sl2)

## Location defined by its numeric index
sl3 <- modifyList(sl1, list(textloc = 140, position='above'))

spplot(meuse.grid["dist"],
       col.regions=myCols, 
       sp.layout = sl3)




