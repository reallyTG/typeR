library(IAPWS95)


### Name: hTpcteTab
### Title: Table of Enthalpies, Function of Temperature and Fixed Pressure
### Aliases: hTpcteTab

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
p <- 5.
Tabh <-  hTpcteTab(T1, T2, dT, p)
Tabh

T1 <- 300.
T2 <- 500.
dT <- 10.
p <- 10.
Tabh <- hTpcteTab(T1, T2, dT, p)
Tabh




