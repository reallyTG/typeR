library(mousetrap)


### Name: scale_within
### Title: Scale and center variables within the levels of another
###   variable.
### Aliases: scale_within

### ** Examples

ChickWeight_scaled <-  scale_within(
 ChickWeight, variables="weight",
 within="Chick", prefix="z_")
 



