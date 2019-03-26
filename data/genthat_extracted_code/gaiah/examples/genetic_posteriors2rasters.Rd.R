library(gaiah)


### Name: genetic_posteriors2rasters
### Title: Convert posteriors to particular genetic reporting groups into
###   raster
### Aliases: genetic_posteriors2rasters

### ** Examples

library(raster)  # needed to deal with "genetic_regions" variable
# get a small subset of individuals so it doesn't take too long
data(breeding_wiwa_genetic_posteriors)
data(genetic_regions)
BW <- breeding_wiwa_genetic_posteriors %>%
  dplyr::filter(Short_Name %in% c("eNBFR01", "wABCA05", "wORHA21"))

# run the function on those
GPRs <-  genetic_posteriors2rasters(BW, genetic_regions)



