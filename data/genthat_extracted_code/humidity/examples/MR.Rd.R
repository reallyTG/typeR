library(humidity)


### Name: MR
### Title: calculate mixing ratio
### Aliases: MR

### ** Examples

t <- 273.15
Es <- SVP(t)
e <- WVP2(70, Es)
q <- SH(e, p = 101325)
MR(q)



