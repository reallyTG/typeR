library(rubias)


### Name: write_gsi_sim_mixture
### Title: Write a mixture data frame to gsi_sim format baseline and
###   repunits file
### Aliases: write_gsi_sim_mixture

### ** Examples

# this writes to file prefix "mixfile" in a temporary directory
dd <- tempdir()
prefix <- file.path(dd, "mixfile")

# print that
prefix

# note that in practice you will probably want to specify
# your own directory...

# run the function
write_gsi_sim_mixture(chinook_mix, 5, prefix)

# see where those files live:
dir(dd, pattern = "mixfile*", full.names = TRUE)



