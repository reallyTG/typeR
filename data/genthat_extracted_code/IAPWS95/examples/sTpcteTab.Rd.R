library(IAPWS95)


### Name: sTpcteTab
### Title: Table of Entropies, Function of Temperature for a Fixed Pressure
### Aliases: sTpcteTab

### ** Examples

T1 <- 275.
T2 <- 450.
dT <- 5.
p <- 5.
Tabs <- sTpcteTab(T1, T2, dT, p)
Tabs

T1 <- 300.
T2 <- 500.
dT <- 10.
p <- 10.
Tabs <- sTpcteTab(T1, T2, dT, p)
Tabs




