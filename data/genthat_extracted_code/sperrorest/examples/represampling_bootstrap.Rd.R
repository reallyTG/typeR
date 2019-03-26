library(sperrorest)


### Name: represampling_bootstrap
### Title: Non-spatial bootstrap resampling
### Aliases: represampling_bootstrap

### ** Examples

data(ecuador)
# only 10 bootstrap repetitions, normally use >=100:
parti <- represampling_bootstrap(ecuador, repetition = 10)
# plot(parti, ecuador) # careful: overplotting occurs
# because some samples are included in both the training and
# the test sample (possibly even multiple times)



