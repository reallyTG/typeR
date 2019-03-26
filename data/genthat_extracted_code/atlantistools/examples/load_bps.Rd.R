library(atlantistools)


### Name: load_bps
### Title: Extracts the names of the epibenthic biomasspools from the
###   initial conditions file.
### Aliases: load_bps

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")

load_bps(fgs, init)



