library(malariaAtlas)


### Name: autoplot.MAPraster
### Title: Quickly visualise Rasters downloaded from MAP
### Aliases: autoplot.MAPraster

### ** Examples

## No test: 
# Download PfPR2-10 Raster (Bhatt et al 2015) and raw survey points
#   for Madagascar in 2013 and visualise these together on a map.

# Download madagascar shapefile to use for raster download.
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")

# Download PfPR2-10 Raster for 2013 & plot this
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", 
                          shp = MDG_shp, year = 2013)
p <- autoplot_MAPraster(MDG_PfPR2_10, shp_df = MDG_shp)

# Download raw PfPR survey points & plot these over the top of the raster
pr <- getPR(country = c("Madagascar"), species = "Pf")
p[[1]] +
geom_point(data = pr[pr$year_start==2013,],
           aes(longitude, latitude, fill = positive / examined,
               size = examined), shape = 21) +
  scale_size_continuous(name = "Survey Size") +
  scale_fill_distiller(name = "PfPR", palette = "RdYlBu") +
  ggtitle("Raw PfPR Survey points\n +
          Modelled PfPR 2-10 in Madagascar in 2013")


# Download global raster of G6PD deficiency (Howes et al 2012) and visualise this on a map.
G6PDd_global <- getRaster(surface = "G6PD Deficiency Allele Frequency")
autoplot_MAPraster(G6PDd_global)
## End(No test)




