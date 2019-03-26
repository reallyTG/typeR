library(sperrorest)


### Name: represampling_disc_bootstrap
### Title: Overlapping spatial block bootstrap using circular blocks
### Aliases: represampling_disc_bootstrap

### ** Examples

data(ecuador)
# Overlapping disc bootstrap:
parti <-  represampling_disc_bootstrap(ecuador, radius = 200, nboot = 20,
oob = FALSE)
# plot(parti, ecuador)
# Note that a 'buffer' argument would make no difference because boostrap
# sets of discs are drawn independently for the training and test sample.
#
# Overlapping disc bootstrap for training sample, out-of-bag sample as test
# sample:
parti <-  represampling_disc_bootstrap(ecuador, radius = 200, buffer = 200,
                                      nboot = 10, oob = TRUE)
# plot(parti,ecuador)




