library(paleofire)


### Name: pfGridding
### Title: Produce gridded maps of transformed charcoal values.
### Aliases: pfGridding

### ** Examples

## Not run: 
##D ID=pfSiteSel(continent="North America", l12==1, long>-85)
##D 
##D TR=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D p=pfGridding(TR,age=1000)
##D summary(p)
##D 
##D require(raster)
##D plot(p$raster)
##D 
##D ## Example of other_mask usage: we will use here Dyke 2003 ice extent map for North
##D  America
##D require(maptools)
##D ID=pfSiteSel(continent=="North America", long>-100,lat>40)
##D TR=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Define projection (same as Dyke 2003)
##D proj4="+proj=lcc +lat_1=49 +lat_2=77 +lat_0=49
##D  +lon_0=-95 +x_0=0 +y_0=0 +ellps=clrk66 +datum=NAD27 +units=m +no_defs"
##D 
##D ## Download the shapefile
##D where=getwd()
##D download.file("http://blarquez.com/public/data/ice_9500_calBP_lcc.shp",
##D                paste0(where,"/ice_9500_calBP_lcc.shp"))
##D download.file("http://blarquez.com/public/data/ice_9500_calBP_lcc.dbf",
##D                paste0(where,"/ice_9500_calBP_lcc.dbf"))
##D download.file("http://blarquez.com/public/data/ice_9500_calBP_lcc.shx",
##D                paste0(where,"/ice_9500_calBP_lcc.shx"))
##D 
##D ice_shp=readShapePoly(paste0(where,"/ice_9500_calBP_lcc.shp"),
##D                       proj4string=CRS(proj4))
##D plot(ice_shp)
##D 
##D p=pfGridding(TR,age=9500,cell_size=100000,distance_buffer=300000,
##D              proj4=proj4,other_mask=ice_shp)
##D plot(p,add=ice_shp)
##D 
##D # Citation: Dyke, A.S., Moore, A. And Robertson, L. 2003 :
##D # Deglaciation of North America, Geological Survey of Canada Open File 1574.
## End(Not run)




