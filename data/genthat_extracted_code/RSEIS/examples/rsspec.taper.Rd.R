library(RSEIS)


### Name: rsspec.taper
### Title: Taper spectrum
### Aliases: rsspec.taper
### Keywords: misc

### ** Examples


data(CE1)
Xamp <- CE1$y[CE1$x > 5.443754 & CE1$x<5.615951]
###  10% cosine taper:
xtap <- rsspec.taper(Xamp, p = 0.1)





