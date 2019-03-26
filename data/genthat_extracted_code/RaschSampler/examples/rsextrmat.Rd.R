library(RaschSampler)


### Name: rsextrmat
### Title: Extracting a Matrix
### Aliases: rsextrmat
### Keywords: misc

### ** Examples

ctr <- rsctrl(burn_in = 10, n_eff = 3, step=10, seed = 0, tfixed = FALSE)
mat <- matrix(sample(c(0,1), 50, replace = TRUE), nr = 10)
all_m <- rsampler(mat, ctr)
summary(all_m)

# extract the third sampled matrix (here the fourth)
third_m <- rsextrmat(all_m, 4)
head(third_m)



