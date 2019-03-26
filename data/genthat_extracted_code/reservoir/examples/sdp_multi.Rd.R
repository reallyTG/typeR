library(reservoir)


### Name: sdp_multi
### Title: Stochastic Dynamic Programming with multiple objectives (supply,
###   flood control, amenity)
### Aliases: sdp_multi

### ** Examples

layout(1:3)
sdp_multi(resX$Q_Mm3, cap = resX$cap_Mm3, target = 0.2 * mean(resX$Q_Mm3))



