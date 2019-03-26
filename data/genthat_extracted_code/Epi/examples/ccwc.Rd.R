library(Epi)


### Name: ccwc
### Title: Generate a nested case-control study
### Aliases: ccwc
### Keywords: datagen

### ** Examples

#
# For the diet and heart dataset, create a nested case-control study
# using the age scale and matching on job
#
data(diet)
dietcc <- ccwc( doe, dox, chd, origin=dob, controls=2, data=diet,
                include=energy, match=job)



