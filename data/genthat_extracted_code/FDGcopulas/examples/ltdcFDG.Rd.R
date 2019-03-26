library(FDGcopulas)


### Name: ltdcFDG
### Title: Lower tail dependence coefficient of FDG copulas
### Aliases: ltdcFDG

### ** Examples

## FDG copula with 'exponential' generators
myExpo <- FDGcopula("exponential", 1:4)
ltdcFDG(myExpo) 

## FDG copula with Cuadras-Auge generators
myCA <- FDGcopula("cuadrasauge", c(.3,.5,.7,.9))
ltdcFDG(myCA) # lower tail independent



