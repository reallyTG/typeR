library(IAPWS95)


### Name: spTcteTab
### Title: Table of Entropies, Function of Pressure for Fixed Temperature
### Aliases: spTcteTab

### ** Examples

p1 <- 1.0
p2 <- 10.
dp <- 1.
T <- 500.
Tabs <- spTcteTab(p1, p2, dp, T)
Tabs

p1 <- 10.
p2 <- 100.
dp <- 10.
T <- 450.
Tabs <- spTcteTab(p1, p2, dp, T)
Tabs




