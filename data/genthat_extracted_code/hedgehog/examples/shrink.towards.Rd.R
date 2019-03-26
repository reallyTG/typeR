library(hedgehog)


### Name: shrink.towards
### Title: Shrink an integral number by edging towards a destination.
### Aliases: shrink.towards

### ** Examples

shrink.towards (0) (100)
# [0,50,75,88,94,97,99]

shrink.towards(500)(1000)
# [500,750,875,938,969,985,993,997,999]

shrink.towards (-50) (-26)
# [-50,-38,-32,-29,-27]



