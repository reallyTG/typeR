## ------------------------------------------------------------------------
cfg_hh_per_stratum <- 416 #
cfg_hh_per_urban <- 26 # households from each urban PSU
cfg_hh_per_rural <- 26 # households from each rural PSU
cfg_pop_per_psu <- 610 # limit PSU size to the average village size

## ------------------------------------------------------------------------
library(gridsample)
library(raster)
population_raster <- raster(system.file("extdata", "RWA_ppp_2010_adj_v2.tif",
  package="gridsample"))
plot(population_raster)
data(RWAshp)
strata_raster <- rasterize(RWAshp,population_raster,field = "STL.2")
plot(strata_raster)

## ------------------------------------------------------------------------
total_pop <- cellStats(population_raster, stat = "sum")
urban_pop_value <- total_pop * .16
pop_df <- data.frame(index = 1:length(population_raster[]),
  pop = population_raster[])
pop_df <- pop_df[!is.na(pop_df$pop), ]
pop_df <- pop_df[order(pop_df$pop,decreasing = T), ]
pop_df$cumulative_pop <- cumsum(pop_df$pop)
pop_df$urban <- 0
pop_df$urban[which(pop_df$cumulative_pop <= urban_pop_value)] <- 1
urban_raster <- population_raster >= min(subset(pop_df,urban == 1)$pop)
plot(urban_raster)

## ------------------------------------------------------------------------
psu_polygons <- gs_sample(
  population_raster = population_raster,
  strata_raster = strata_raster,
  urban_raster = urban_raster,
  cfg_desired_cell_size = NA,
  cfg_hh_per_stratum = 416,
  cfg_hh_per_urban = 26,
  cfg_hh_per_rural = 26,
  cfg_min_pop_per_cell = 0.01,
  cfg_max_psu_size = 10,
  cfg_pop_per_psu = 610,
  cfg_sample_rururb = TRUE,
  cfg_sample_spatial = FALSE,
  cfg_sample_spatial_scale = 100,
  output_path = tempdir(),
  sample_name = "rwanda_psu"
)
plot(psu_polygons)

