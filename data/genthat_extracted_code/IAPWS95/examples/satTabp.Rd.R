library(IAPWS95)


### Name: satTabp
### Title: Table of Saturation Densities, Enthalpies and Entropies,
###   Function of Pressure
### Aliases: satTabp

### ** Examples

p1 <- 1.0
p2 <- 10.
dp <- 0.5
Tabp <- satTabp(p1, p2, dp)
Tabp

p1 <- 0.1
p2 <- 10.
dp <- 0.5
Tabp <- satTabp(p1, p2, dp)
Tabp




