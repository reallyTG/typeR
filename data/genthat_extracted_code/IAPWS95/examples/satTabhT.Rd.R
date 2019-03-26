library(IAPWS95)


### Name: satTabhT
### Title: Table of Saturation Liquid Phase Enthalpies, Function of
###   Temperature
### Aliases: satTabhT

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
TabT <- satTabhT(T1, T2, dT)
TabT

T1 <- 300.
T2 <- 500.
dT <- 10.
TabT <- satTabhT(T1, T2, dT)
TabT




