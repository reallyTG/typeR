library(EcoHydRology)


### Name: transmissivity
### Title: Transmissivity
### Aliases: transmissivity

### ** Examples

##  Assuming the temperature measurements are consecutive days, default option:
transmissivity(Tx=c(10,10,10,10,10), Tn=c(1,2,6,9,2))
## Second option:
transmissivity(Tx=c(10,10,10,10,10), Tn=c(1,2,6,9,2), opt="2day")
##  When the days are not consecutive:
transmissivity(Tx=c(10,10,10,10,10), Tn=c(1,2,6,9,2), JD=c(250,265,300,320,321), opt="missingdays")



