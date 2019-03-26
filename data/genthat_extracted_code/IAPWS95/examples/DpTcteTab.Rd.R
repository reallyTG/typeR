library(IAPWS95)


### Name: DpTcteTab
### Title: Table of Densities, Function of Pressure for a Fixed Temperature
### Aliases: DpTcteTab

### ** Examples

p1 <- 1.0
p2 <- 10.
dp <- 1.
T <- 500.
TabD <- DpTcteTab(p1, p2, dp, T)
TabD

p1 <- 10.
p2 <- 100.
dp <- 10.
T <- 450.
TabD <- DpTcteTab(p1, p2, dp, T)
TabD




