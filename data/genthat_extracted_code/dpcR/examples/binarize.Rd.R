library(dpcR)


### Name: binarize
### Title: Binarize digital PCR data
### Aliases: binarize
### Keywords: manip

### ** Examples


#adpcr object
rand_array <- sim_adpcr(200, 300, 100, pos_sums = FALSE, n_panels = 1)
binarize(rand_array)

#dpcr object
rand_droplets <- sim_dpcr(200, 300, 100, pos_sums = FALSE, n_exp = 1)
binarize(rand_droplets)



