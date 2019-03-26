library(IAPWS95)


### Name: satTabvT
### Title: Table of Saturation Volumes, Enthalpies and Entropies, Function
###   of of Temperature
### Aliases: satTabvT

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
TabT <- satTabvT(T1, T2, dT)
TabT

T1 <- 300.
T2 <- 500.
dT <- 10.
TabT <- satTabvT(T1, T2, dT)
TabT




