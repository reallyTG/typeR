library(IsoplotR)


### Name: set.zeta
### Title: Calculate the zeta calibration coefficient for fission track
###   dating
### Aliases: set.zeta

### ** Examples

data(examples)
print(examples$FT1$zeta)
FT <- set.zeta(examples$FT1,tst=c(250,5))
print(FT$zeta)




