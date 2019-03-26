library(rosm)


### Name: rosm
### Title: Plot Raster Map Tiles From Open Street Map and Other Sources
### Aliases: rosm rosm-package

### ** Examples


## No test: 
 library(rcanvec)
 library(prettymapr)
 library(sp)

 # basic ploting
 nsbox <- searchbbox("nova scotia", source="google")
 osm.plot(nsbox)
 osm.plot(nsbox, type="stamenbw")
 bmaps.plot(nsbox)
 bmaps.plot(nsbox, type="Road")

 # use {prettymapr} to add scalebar and north arrow
 prettymap(osm.plot(nsbox))
 prettymap(bmaps.plot(nsbox, type="Road"))

 # increase res argument to plot to file
 pdf(height=8, width=10.5)
 prettymap(osm.plot(nsbox, type="stamenbw", res=300, stoponlargerequest=FALSE),
           scale.label.col="white", arrow.text.col = "white",
           scale.linecol = "white", arrow.border = "white")
 dev.off()

 # use osm.raster() to export a RasterStack of tiles
 library(raster)
 x <- osm.raster(nsbox)
 x <- osm.raster(nsbox, projection=CRS("+init=epsg:26920")) #reproject to UTM 20
 plotRGB(x) #plot reprojected image
 # write to disk by passing a filename= argument
 osm.raster(nsbox, projection=CRS("+init=epsg:26920"), filename="ns2.tif")


 # canvec.qplot and hillshade using the add=TRUE argument
 prettymap({
   altabox <- prettymapr::searchbbox("Alta Lake BC", source="google")
   canvec.qplot(bbox=altabox,
                layers=c("waterbody", "forest", "river", "road"))
   osm.plot(altabox, type="hillshade", add=T, project = FALSE)
 })

 # define custom tile types in several ways

 # using string formats
 ts <- as.tile_source("http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png")
 osm.plot(nsbox, type=ts)

 # using string formats and register_tile_source
 register_tile_source(dark = "http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png")
 osm.plot(nsbox, type="dark")

 # set default plot type to something other than 'osm'
 set_default_tile_source("stamenbw")
 osm.plot(nsbox)

 
## End(No test)




