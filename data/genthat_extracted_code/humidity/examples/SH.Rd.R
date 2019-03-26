library(humidity)


### Name: SH
### Title: calculate specific humidity
### Aliases: SH

### ** Examples

t <- 273.15
Es <- SVP(t)
e <- WVP2(70, Es)
SH(e, p = 101325)



