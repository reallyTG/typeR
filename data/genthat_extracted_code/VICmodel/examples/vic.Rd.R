library(VICmodel)


### Name: vic
### Title: VIC model run for each gridcells
### Aliases: print.vic_output vic

### ** Examples

# This is a sample data to run VIC.
data(STEHE)

forcing <- STEHE$forcing
soil <- STEHE$soil
veg <- STEHE$veg

# Set the global options for a 7-days run.
vic_param('start_year', 1949)
vic_param('start_month', 1)
vic_param('start_day', 1)
vic_param('end_year', 1949)
vic_param('end_month', 1)
vic_param('end_day', 7)
vic_param('step_per_day', 24)
vic_param('snow_step_per_day', 24)
vic_param('runoff_step_per_day', 24)

# Run VIC.
outputs <- vic(forcing, soil, veg)
print(outputs)

# Use user defind outputs and snowband parameters.
vic_param('nbands', 5)
band <- STEHE$snowbands

out_info <- list(
  wb = list(timescale = 'hour', aggpar = 6,
            outvars = c('OUT_RUNOFF', 'OUT_BASEFLOW', 'OUT_SOIL_MOIST'),
            aggtypes = c('sum', 'sum', 'end')),
  eb = list(timescale = 'day', aggpar = 1,
            outvars = c('OUT_SWE', 'OUT_SOIL_TEMP'),
            aggtypes = c('avg', 'min'))
)

outputs <- vic(forcing, soil, veg, snowband = band, output_info = out_info)
print(outputs)

# Example of parallelization
## No test: 
library(doParallel)
registerDoParallel(cores=4)
outputs <- vic(forcing, soil, veg, snowband = band, parall = TRUE)
stopImplicitCluster()
print(outputs)
## End(No test)




