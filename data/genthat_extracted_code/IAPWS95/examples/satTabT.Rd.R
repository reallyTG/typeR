library(IAPWS95)


### Name: satTabT
### Title: Table of Saturation Densities, Enthalpies and Entropies,
###   Function of Temperature
### Aliases: satTabT

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
TabT <- satTabT(T1, T2, dT)
TabT

T1 <- 300.
T2 <- 500.
dT <- 10.
TabT <- satTabT(T1, T2, dT)
TabT




