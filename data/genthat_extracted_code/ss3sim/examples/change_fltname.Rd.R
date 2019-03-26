library(ss3sim)


### Name: change_fltname
### Title: Standardize column name for FltSvy in event 'r4ss' is not the
###   newest version.
### Aliases: change_fltname

### ** Examples

d <- system.file("extdata", package = "ss3sim")
file_in <- file.path(d, "Simple", "simple.dat")
# Here one should include the argument \code{section = 2}
# but this \code{.dat} file does not have multiple sections.
dat_in <- r4ss::SS_readdat(file_in, verbose = FALSE)
dat_fixed <- change_fltname(dat_in)
# Check mean size-at-age
names(dat_fixed$MeanSize_at_Age_obs)[3] == "FltSvy"



