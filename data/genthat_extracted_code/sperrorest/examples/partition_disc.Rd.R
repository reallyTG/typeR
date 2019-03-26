library(sperrorest)


### Name: partition_disc
### Title: Leave-one-disc-out cross-validation and leave-one-out
###   cross-validation
### Aliases: partition_disc partition_loo

### ** Examples

data(ecuador)
parti <- partition_disc(ecuador, radius = 200, buffer = 200,
                        ndisc = 5, repetition = 1:2)
# plot(parti,ecuador)
summary(parti)

# leave-one-out with buffer:
parti.loo <- partition_loo(ecuador, buffer = 200)
summary(parti)



