library(SPIGA)


### Name: Drought Index from Parameters
### Title: Calculation of standardized precipitation index from alpha and
###   beta parameter of the Gamma function.
### Aliases: SPIFromParameters

### ** Examples

#### Load data
data(Pm_Pisco)
data(alphaGA_SPI3)
data(betaGA_SPI3)

#### Computing SPI with Genetic Algorithms
Pmon<-Pm_Pisco
Param_Alpha <- alphaGA_SPI3
Param_Beta <- betaGA_SPI3
SPIFromParameters(Pmon, scale =3, Param_Alpha, Param_Beta)



