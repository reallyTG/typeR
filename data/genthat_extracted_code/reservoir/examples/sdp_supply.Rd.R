library(reservoir)


### Name: sdp_supply
### Title: Stochastic Dynamic Programming for water supply reservoirs
### Aliases: sdp_supply

### ** Examples

layout(1:3)
sdp_supply(resX$Q_Mm3, capacity = resX$cap_Mm3, target = 0.3 *mean(resX$Q_Mm3))
sdp_supply(resX$Q_Mm3, capacity = resX$cap_Mm3, target = 0.3 *mean(resX$Q_Mm3), Markov = TRUE)



