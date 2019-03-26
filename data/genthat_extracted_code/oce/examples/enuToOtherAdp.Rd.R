library(oce)


### Name: enuToOtherAdp
### Title: Convert ADP ENU to Rotated Coordinate
### Aliases: enuToOtherAdp

### ** Examples


library(oce)
data(adp)
o <- enuToOtherAdp(adp, heading=-31.5)
plot(o, which=1:3)




