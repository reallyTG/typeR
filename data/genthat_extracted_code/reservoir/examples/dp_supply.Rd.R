library(reservoir)


### Name: dp_supply
### Title: Dynamic Programming for water supply reservoirs
### Aliases: dp_supply

### ** Examples

layout(1:3)
dp_supply(resX$Q_Mm3, capacity = resX$cap_Mm3, target = 0.3 * mean(resX$Q_Mm3), S_disc = 100)



