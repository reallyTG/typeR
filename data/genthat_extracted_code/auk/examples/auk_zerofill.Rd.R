library(auk)


### Name: auk_zerofill
### Title: Read and zero-fill an eBird data file
### Aliases: auk_zerofill auk_zerofill.data.frame auk_zerofill.character
###   auk_zerofill.auk_ebd collapse_zerofill

### ** Examples

# read and zero-fill the ebd data
f_ebd <- system.file("extdata/zerofill-ex_ebd.txt", package = "auk")
f_smpl <- system.file("extdata/zerofill-ex_sampling.txt", package = "auk")
auk_zerofill(x = f_ebd, sampling_events = f_smpl)

# use the species argument to only include a subset of species
auk_zerofill(x = f_ebd, sampling_events = f_smpl,
             species = "Collared Kingfisher")

# to return a data frame use collapse = TRUE
ebd_df <- auk_zerofill(x = f_ebd, sampling_events = f_smpl, collapse = TRUE)



