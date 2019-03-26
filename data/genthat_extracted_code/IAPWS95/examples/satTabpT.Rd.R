library(IAPWS95)


### Name: satTabpT
### Title: Table of Saturation Pressures, Function of Temperature
### Aliases: satTabpT

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
TabT <- satTabpT(T1, T2, dT)
TabT

T1 <- 300.
T2 <- 500.
dT <- 10.
TabT <- satTabpT(T1, T2, dT)
TabT




