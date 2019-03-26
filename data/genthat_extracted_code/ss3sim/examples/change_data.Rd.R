library(ss3sim)


### Name: change_data
### Title: Change the data that is available as output from an SS operating
###   model.
### Aliases: change_data

### ** Examples

d <- system.file("extdata", package = "ss3sim")
fleets <- 1:2
years <- c(5, 10, 15)
types <- c("len", "age")
file_in <- r4ss::SS_readdat(paste0(d, "/models/cod-om/codOM.dat"))
file_in <- change_fltname(file_in)

# Basic test with just length data, default bins:
out <- change_data(file_in, outfile = "ignore.dat", types = "len",
  years = years, fleets = fleets, write_file = FALSE)
print(out$lbin_vector)
print(out$lencomp)

# Change the length bins:
out <- change_data(file_in, "ignore.dat", types = "len",
  years = years, fleets = fleets, len_bins = 3:6, write_file = FALSE)
out$lbin_vector
out$lencomp

# Change the population length bins:
out <- change_data(file_in, "ignore.dat", types = "len",
  years = years, fleets = fleets, pop_binwidth = 1, pop_minimum_size = 5,
  pop_maximum_size = 210, write_file = FALSE)
out$binwidth
out$maximum_size
out$minimum_size

# Sample from index, length composition, age composition, catch at length,
# mean length at age data: (normally this is all done from within run_ss3sim).

index_params = list(fleets = c(1, 2), years = list(c(1, 2),
  c(10, 11)), sds_obs = c(0.1, 0.2))
lcomp_params = list(Nsamp = list(12345), fleets = 1, years = list(c(1, 5)))
agecomp_params = list(Nsamp = list(12345), fleets = c(1, 2),
  years = list(2, c(15, 16)))
calcomp_params = list(Nsamp = list(1), fleets = c(1), years = 98)
mlacomp_params = list(fleets = c(2), Nsamp = 54, years = list(c(1, 15)))
d <- system.file("extdata", package = "ss3sim")
f_in <- paste0(d, "/models/cod-om/codOM.dat")
dat_list <- r4ss::SS_readdat(f_in, verbose = FALSE)
dat_list <- change_fltname(dat_list)
data_units <- calculate_data_units(index_params = index_params,
  lcomp_params = lcomp_params, agecomp_params = agecomp_params,
  calcomp_params = calcomp_params, mlacomp_params = mlacomp_params)
data_units
dat2 <- with(data_units, change_data(dat_list = dat_list, fleets = fleets,
  years = years, types = types, write_file = FALSE))
dat3 <- clean_data(dat_list = dat2, lcomp_params = lcomp_params,
  index_params = index_params, agecomp_params = agecomp_params,
  calcomp_params = calcomp_params, mlacomp_params = mlacomp_params,
  verbose = TRUE)



