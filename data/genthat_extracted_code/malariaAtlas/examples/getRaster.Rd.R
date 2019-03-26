library(malariaAtlas)


### Name: getRaster
### Title: Download Rasters produced by the Malaria Atlas Project
### Aliases: getRaster

### ** Examples

# Download PfPR2-10 Raster for Madagascar in 2015 and visualise this immediately.
## No test: 
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", shp = MDG_shp, year = 2015)
autoplot_MAPraster(MDG_PfPR2_10)

# Download global raster of G6PD deficiency from Howes et al 2012.
G6PDd_global <- getRaster(surface = "G6PD Deficiency Allele Frequency")
autoplot_MAPraster(G6PDd_global)

# Download a temporal raster by range
MDG_PfPR2_10_range <- getRaster(surface = "Plasmodium falciparum PR2-10", 
                                shp = MDG_shp, year = 2012:2015)

# Download a mix of rasters
MDG_rasters <- getRaster(surface = c("Plasmodium falciparum PR2-10", 
                                     'Plasmodium falciparum Incidence', 
                                     'Plasmodium falciparum Support'),
                         shp = MDG_shp, year = list(2009:2012, 2005:2007, NA))
p <- autoplot_MAPraster(MDG_rasters)

## End(No test)




