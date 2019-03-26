library(palaeoSig)


### Name: jointsig
### Title: Test if two variables jointly control changes in fossil data
### Aliases: jointsig plot.js
### Keywords: multivariate htest hplot

### ** Examples

require(rioja)
data(SWAP)
data(RLGH)

rlgh.js <- jointsig(spp = sqrt(SWAP$spec), fos = sqrt(RLGH$spec), var1 = SWAP$pH, 
    var2 = sample(SWAP$pH), method = "randomTF", n = 99, r = 32, fun = WA, col = 1)
    #nonsense second variable

plot(rlgh.js, c("acid", "alkaline"), c("down", "up"))



