library(profile)


### Name: validate_profile
### Title: Definition of the profile data format
### Aliases: validate_profile

### ** Examples

rprof_file <- system.file("samples/rprof/1.out", package = "profile")
ds <- read_rprof(rprof_file)
validate_profile(ds)
ds$samples <- NULL
try(validate_profile(ds))



