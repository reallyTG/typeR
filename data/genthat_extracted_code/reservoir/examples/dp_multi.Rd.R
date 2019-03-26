library(reservoir)


### Name: dp_multi
### Title: Dynamic Programming with multiple objectives (supply, flood
###   control, amenity)
### Aliases: dp_multi

### ** Examples

layout(1:3)
dp_multi(resX$Q_Mm3, cap = resX$cap_Mm3, target = 0.2 * mean(resX$Q_Mm3), S_disc = 100)



