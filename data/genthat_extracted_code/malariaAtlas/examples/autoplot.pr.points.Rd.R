library(malariaAtlas)


### Name: autoplot.pr.points
### Title: Create a basic plot showing locations of downloaded PR points
### Aliases: autoplot.pr.points

### ** Examples

## No test: 
PfPR_surveys_NGA <- getPR(country = c("Nigeria"), species = "Pf")
autoplot(PfPR_surveys_NGA)

# Download PfPR2-10 Raster (Bhatt et al. 2015) and raw survey points for Madagascar in
#   2013 and visualise these together on a map.

# Download madagascar shapefile to use for raster download.
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")

# Download PfPR2-10 Raster for 2013 & plot this
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", shp = MDG_shp, year = 2013)
p <- autoplot_MAPraster(MDG_PfPR2_10)

# Download raw PfPR survey points & plot these over the top of the raster
pr <- getPR(country = c("Madagascar"), species = "Pf")
p[[1]] +
geom_point(data = pr[pr$year_start==2013,],
           aes(longitude, latitude, fill = positive / examined,
               size = examined), shape = 21) +
  scale_size_continuous(name = "Survey Size") +
  scale_fill_distiller(name = "PfPR", palette = "RdYlBu") +
  ggtitle("Raw PfPR Survey points\n + Modelled PfPR 2-10 in Madagascar in 2013")
## End(No test)




