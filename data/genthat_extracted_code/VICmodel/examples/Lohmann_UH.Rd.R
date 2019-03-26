library(VICmodel)


### Name: Lohmann_UH
### Title: Simulate the streamflow discharge of the VIC model outputs by
###   the routing model of Lohmann et al.
### Aliases: Lohmann_UH Lohmann_conv

### ** Examples

# Paths of the samples of the flow direction file and fraction file
direc_file <- system.file("extdata", "direc_STEHE.asc", package = "VICmodel")
fract_file <- system.file("extdata", "fract_STEHE.asc", package = "VICmodel")

# Generate the unit hydrograph data of each gridcells.
uh <- Lohmann_UH(direc_file, STEHE$soil, stn_x = -120.7, stn_y = 48.31,
                 fract = fract_file)

# Streamflow routing using the VIC output
sf <- Lohmann_conv(STEHE$runoff_table_daily, uh)

# Draw the output hydrograph
plot(sf$daily, type = 'l')

obs <- STEHE$streamflow_obs
plot(obs, type = 'l')
lines(sf$monthly, col = 'blue')




