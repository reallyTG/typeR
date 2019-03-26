library(IAPWS95)


### Name: hpTcteTab
### Title: Table of Enthalpies, Function of Pressure for Fixed Temperature
### Aliases: hpTcteTab

### ** Examples

p1 <- 1.0
p2 <- 10.
dp <- 1.
T <- 500.
Tabh <- hpTcteTab(p1, p2, dp, T)
Tabh

p1 <- 10.
p2 <- 100.
dp <- 10.
T <- 450.
Tabh <- hpTcteTab(p1, p2, dp, T)
Tabh




