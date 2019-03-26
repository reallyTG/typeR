library(malariaAtlas)


### Name: autoplot.vector.points
### Title: Create a basic plot showing locations of downloaded Vector
###   points
### Aliases: autoplot.vector.points

### ** Examples

## No test: 
Vector_surveys_NGA_NG <- getVecOcc(country = c("Nigeria", "Niger"))
autoplot(Vector_surveys_NGA_NG)

# Download the predicted distribution of An. dirus species complex Raster and  
#  vector points for Myanmar and visualise these together on a map.

# Download Myanmar shapefile to use for raster download.
MMR_shp <- getShp(ISO = "MMR", admin_level = "admin0")
MMR_shp_df <- as.MAPshp(MMR_shp)

# Download An. dirus predicted distribution Raster & plot this
MMR_An_dirus <- getRaster(surface = "Anopheles dirus species complex", shp = MMR_shp)
MMR_An_dirus_df <- as.MAPraster(MMR_An_dirus)
p <- autoplot_MAPraster(MMR_An_dirus, shp_df = MMR_shp_df, printed = FALSE)

# Download raw occurrence points & plot these over the top of the raster   
species <- getVecOcc(country = "Myanmar", species = "Anopheles dirus")
p[[1]] +
geom_point(data = species,
 aes(longitude,
  latitude,
  colour = species))+
  scale_colour_manual(values = "black", name = "Vector suvery locations")+
scale_fill_distiller(name = "Predicted distribution of An. dirus complex",
 palette = "PuBuGn",
  direction = 1)+
  ggtitle("Vector Survey points\n + The predicted distribution of An. dirus complex")
## End(No test)




