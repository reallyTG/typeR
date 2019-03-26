library(mosaicModel)


### Name: Tadpoles
### Title: Swimming speed of tadpoles.
### Aliases: Tadpoles
### Keywords: datasets

### ** Examples

mod_1 = lm(vmax ~ poly(rtemp, 2) * group + length, data = Tadpoles)



