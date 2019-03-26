library(malariaAtlas)


### Name: as.MAPraster
### Title: Convert Raster objects into MAPraster objects
### Aliases: as.MAPraster

### ** Examples

# Download PfPR2-10 Raster for Madagascar in 2015 and visualise this on a map.
## No test: 
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", shp = MDG_shp, year = 2015)
MDG_PfPR2_10 <- as.MAPraster(MDG_PfPR2_10)
autoplot(MDG_PfPR2_10)
## End(No test)

#Download global raster of G6PD deficiency from Howes et al 2012 and visualise this on a map.
## No test: 
G6PDd_global <- getRaster(surface = "G6PD Deficiency Allele Frequency")
G6PDd_global <- as.MAPraster(G6PDd_global)
autoplot(G6PDd_global)
## End(No test)




