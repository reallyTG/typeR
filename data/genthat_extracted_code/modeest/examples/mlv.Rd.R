library(modeest)


### Name: mlv
### Title: Estimation of the Mode(s) or Most Likely Value(s)
### Aliases: mlv mlv.character mlv.factor mlv.logical mlv.integer
###   mlv.default mlv.density mlv1

### ** Examples

# Unimodal distribution
x <- rbeta(1000,23,4)

## True mode
betaMode(23, 4)
# or
mlv("beta", 23, 4)

## Estimate of the mode
mlv(x, method = "lientz", bw = 0.2)
mlv(x, method = "naive", bw = 1/3)
mlv(x, method = "venter", type = "shorth")
mlv(x, method = "grenander", p = 4)
mlv(x, method = "hsm")
mlv(x, method = "parzen", kernel = "gaussian")
mlv(x, method = "tsybakov", kernel = "gaussian")
mlv(x, method = "asselin", bw = 2/3)
mlv(x, method = "vieu")
mlv(x, method = "meanshift")




