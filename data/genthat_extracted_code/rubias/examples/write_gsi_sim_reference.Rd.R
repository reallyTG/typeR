library(rubias)


### Name: write_gsi_sim_reference
### Title: Write a reference data frame to gsi_sim format baseline and
###   repunits file
### Aliases: write_gsi_sim_reference

### ** Examples

# create a temp directory to put example outputs
dd <- tempdir()
basefile <- file.path(dd, "baseline.txt")
repunitsfile <- file.path(dd, "repunits.txt")

# print those
basefile
repunitsfile

# note that in practice you will probably want to specify
# your own filepaths...

# run the function
write_gsi_sim_reference(alewife, 17, basefile, repunitsfile)



