library(RStoolbox)


### Name: ggR
### Title: Plot RasterLayers in ggplot with greyscale
### Aliases: ggR

### ** Examples

library(ggplot2)
library(raster)
data(rlogo)

## Simple grey scale annotation
ggR(rlogo)

## With linear stretch contrast enhancement
ggR(rlogo, stretch = "lin", quantiles = c(0.1,0.9))

## Don't plot, just return a data.frame
df <- ggR(rlogo, ggObj = FALSE)
head(df)

## ggplot with geom_raster instead of annotation_raster
## and default scale_fill*
ggR(rlogo, geom_raster = TRUE)

## with different scale
ggR(rlogo, geom_raster = TRUE) +
        scale_fill_gradientn(name = "mojo", colours = rainbow(10)) +
        ggtitle("**Funkadelic**")

## Layermode (ggLayer=TRUE)
data <- data.frame(x = c(0, 0:100,100), y = c(0,sin(seq(0,2*pi,pi/50))*10+20, 0))
ggplot(data, aes(x, y)) +  ggR(rlogo, geom_raster= FALSE, ggLayer = TRUE) +
       geom_polygon(aes(x, y), fill = "blue", alpha = 0.4) +
       coord_equal(ylim=c(0,75))

## Categorical data 
## In this case you probably want to use geom_raster=TRUE 
## in order to perform aestetic mapping (i.e. a meaningful legend)
rc <- raster(rlogo)
rc[] <- cut(rlogo[[1]][], seq(0,300, 50))
ggR(rc, geom_raster = TRUE)

## Legend cusomization etc. ...
ggR(rc, geom_raster = TRUE) + scale_fill_discrete(labels=paste("Class", 1:6))
 
## Creating a nicely looking DEM with hillshade background
data(srtm)
terr <- terrain(srtm, c("slope", "aspect"))
hill <- hillShade(terr[["slope"]], terr[["aspect"]])
ggR(hill)

ggR(hill) + 
   ggR(srtm, geom_raster = TRUE, ggLayer = TRUE, alpha = 0.3) +
   scale_fill_gradientn(colours = terrain.colors(100), name = "elevation")



