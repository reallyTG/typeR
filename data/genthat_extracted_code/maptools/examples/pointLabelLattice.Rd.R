library(maptools)


### Name: panel.pointLabel
### Title: Label placement with spplot and lattice.
### Aliases: panel.pointLabel sp.pointLabel sp.pointLabel-methods
###   sp.pointLabel,SpatialPoints-method

### ** Examples

n <- 15
x <- rnorm(n)*10
y <- rnorm(n)*10
labels <- as.character(round(x, 5))


myTheme <- list(add.text=list(
                  cex=0.7,
                  col='midnightblue',
                  fontface=2,
                  fontfamily='mono'))
library(lattice)
xyplot(y~x,
       labels=labels,
       par.settings=myTheme, 
       panel=function(x, y, labels, ...){
         panel.xyplot(x, y, ...)
         panel.pointLabel(x, y, labels=labels, ...)
       })



data(meuse.grid)
coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE

library(RColorBrewer)
myCols <- adjustcolor(colorRampPalette(brewer.pal(n=9, 'Reds'))(100), .85)

pts <- spsample(meuse.grid, n=15, type="random")

Rauthors <- readLines(file.path(R.home("doc"), "AUTHORS"))[9:28]
someAuthors <- Rauthors[seq_along(pts)]

sl1 <- list('sp.points', pts, pch=19, cex=.8, col='midnightblue')
sl2 <- list('sp.pointLabel', pts, label=someAuthors,
            cex=0.7, col='midnightblue',
            fontfamily='Palatino')

spplot(meuse.grid["dist"], col.regions=myCols, sp.layout=list(sl1, sl2))



