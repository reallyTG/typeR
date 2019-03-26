library(gridsample)


### Name: gs_sample
### Title: GridSample sampling algorithm
### Aliases: gs_sample

### ** Examples

require(raster)

poprast <- raster(ncols = 100, nrows = 100, xmx = 10, xmn = 9, ymn = 9, ymx = 10,
   crs = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"),
   vals = runif(10000, 0, 100))
stratarast <- raster(ncols = 100, nrows = 100, xmx = 10, xmn = 9, ymn = 9, ymx = 10,
   crs = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"),
   vals = c(rep(1, times = 5000), rep(2, times = 5000)))
urbanrast <- poprast > 25

example_1 <- gs_sample(
    population_raster = poprast,
    strata_raster = stratarast,
    urban_raster = urbanrast,
    cfg_hh_per_stratum = 800,
    cfg_hh_per_urban = 20,
    cfg_hh_per_rural = 20,
    cfg_pop_per_psu = 500,
    cfg_sample_rururb = TRUE,
    cfg_sample_spatial = FALSE,
    cfg_sample_spatial_scale = 100,
    cfg_desired_cell_size = NA,
    cfg_max_psu_size = 5,
    cfg_min_pop_per_cell = 0.01,
    output_path = tempdir(),
    sample_name="Example"
)
plot(example_1)

#### Example two is the identical, except PSUs aren't grown,
#### so the shapefile returned includes a single grid cell for each PSU.

example_2 <- gs_sample(
   population_raster = poprast,
   strata_raster = stratarast,
   urban_raster = urbanrast,
   cfg_hh_per_stratum = 800,
   cfg_hh_per_urban = 20,
   cfg_hh_per_rural = 20,
   cfg_pop_per_psu = 500,
   cfg_sample_rururb = TRUE,
   cfg_sample_spatial = FALSE,
   cfg_sample_spatial_scale = 100,
   cfg_desired_cell_size = NA,
   cfg_max_psu_size = 5,
   cfg_min_pop_per_cell = 0.01,
   cfg_psu_growth = FALSE,
   output_path = tempdir(),
   sample_name="Example_without_growth"
)
plot(example_2)




