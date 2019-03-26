library(humidity)


### Name: AH
### Title: calculate absolute humidity
### Aliases: AH

### ** Examples

t <- 273.15
Es <- SVP(t)
e <- WVP2(70, Es)
AH(e, t)



