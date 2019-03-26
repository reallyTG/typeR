library(binGroup)


### Name: bgtWidth
### Title: Expected Width of Confidence Intervals in Binomial Group Testing
### Aliases: bgtWidth bgtWidthI
### Keywords: htest

### ** Examples


# There is a minimal expected CI length, if 
# group size s is increased (fixed other parameters)
# the corresponding group size might be chosen:

bgtWidth(n=20, s=seq(from=1, to=200, by=10),
 p=0.01, alternative="less", method="CP" )

# and this depends largely on the assumed proportion p: 

bgtWidth(n=20, s=seq(from=1, to=200, by=10),
 p=0.05, alternative="less", method="CP" )

bgtWidth(n=20, s=seq(from=1, to=200, by=10),
 p=0.005, alternative="less", method="CP" )



