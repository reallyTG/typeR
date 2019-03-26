library(nanop)


### Name: getBase
### Title: Fractional coordinates and scattering parameters for a given
###   chemical element
### Aliases: getBase getScatterLength getScatterFactor scatterFactor
### Keywords: simulation

### ** Examples

## get fractional coordinates for Zn
Cd_base <- getBase("Zn")  
## get scattering parameters for Cd
Cd_scL <- getScatterLength("Cd") 
Cd_scF <- getScatterFactor("Cd")

Se_base <- getBase("S")
Se_scL <- getScatterLength("Se")
Se_scF <- getScatterFactor("Se")

Q <- seq(0.1, 15, 0.1)
## plot scattering factor
plot(Q, scatterFactor(Se_scF, Q))



