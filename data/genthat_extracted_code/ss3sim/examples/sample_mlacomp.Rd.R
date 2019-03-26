library(ss3sim)


### Name: sample_mlacomp
### Title: [BETA VERSION] Sample mean length (size-)-at-age data and write
###   to file for use by the EM.
### Aliases: sample_mlacomp

### ** Examples

temp_path <- file.path(tempdir(), "ss3sim-test")
dir.create(temp_path, showWarnings = FALSE)
wd <- getwd()
setwd(temp_path)
d <- system.file("extdata/models/cod-om", package = "ss3sim")
dat_in <- file.path(d, "codOM.dat")
dat_list <- r4ss::SS_readdat(dat_in, verbose = FALSE)
dat_list <- change_fltname(dat_list)
dat_list <- change_data(dat_list, outfile = NULL, write_file = FALSE,
  fleets = 1, years = 1990:2010, types = c("age", "mla"))
dat_list <- change_fltname(dat_list)
ctl_file_in <- file.path(d, "codOM.ctl")

out <- sample_mlacomp(dat_list, outfile = NULL, ctl_file_in = ctl_file_in,
                      fleets = 1, Nsamp = 30, years = list(1992),
                      verbose = FALSE, mean_outfile = "test.csv", write_file = FALSE)

setwd("..")
unlink("ss3sim-test", recursive = TRUE)
setwd(wd)



