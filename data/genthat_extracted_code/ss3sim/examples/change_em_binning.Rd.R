library(ss3sim)


### Name: change_em_binning
### Title: Change population and observed length composition bins in an SS
###   estimation model
### Aliases: change_em_binning

### ** Examples

d <- system.file("extdata", package = "ss3sim")
f_in <- paste0(d, "/example-om/data.ss_new")
dat_list <- r4ss::SS_readdat(file = f_in, verbose = FALSE)
l <- change_em_binning(dat_list, dat_file_out = NULL, lbin_method = 1,
  bin_vector = seq(8, 30, by = 1), write_file = FALSE)
print(l$lbin_vector)
print(head(l$lencomp))

# An small example with conditional age-at-length re-binning:
f <- system.file("extdata", "models", "cod-om", "codOM.dat", package = "ss3sim")
d <- r4ss::SS_readdat(f, verbose = FALSE)

# Add catch at length data (and simplify the bin structure for this example)
olddat <- change_data(d, outfile = NULL, write_file = FALSE,
  types = c("len", "age", "cal"), fleets = 1, years = seq(2000, 2002),
  age_bins = 1:3, len_bins = 4:8)
olddat$agecomp
newdat <- change_em_binning(olddat, dat_file_out = NULL, bin_vector = c(4, 6, 8),
  lbin_method = 1, write_file = FALSE)
newdat$agecomp

# A larger conditional age-at-length re-rebinning example:
olddat <- change_data(d, outfile = NULL, write_file = FALSE,
 types = c("len", "age", "cal"), fleets = 1, years = seq(2000, 2005),
 age_bins = seq(1, 5), len_bins = round(seq(20, 30, length.out = 13), 1))

olddat$lbin_vector
head(olddat$lencomp)
head(olddat$agecomp)
newdat <- change_em_binning(olddat, dat_file_out = NULL, bin_vector = seq(20, 30, 2),
 lbin_method = 1, write_file = FALSE)
newdat$lbin_vector
head(newdat$lencomp)
newdat$agecomp



