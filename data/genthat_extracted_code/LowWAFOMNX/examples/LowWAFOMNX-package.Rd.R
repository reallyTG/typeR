library(LowWAFOMNX)


### Name: LowWAFOMNX-package
### Title: Low WAFOM Niederreiter-Xing Sequence
### Aliases: LowWAFOMNX-package LowWAFOMNX

### ** Examples

srange <- lowWAFOMNX.dimMinMax()
mrange <- lowWAFOMNX.dimF2MinMax(srange[1])
points <- lowWAFOMNX.points(dimR=srange[1], dimF2=mrange[1])
points <- lowWAFOMNX.points(dimR=srange[1], dimF2=mrange[1], digitalShift=TRUE)



