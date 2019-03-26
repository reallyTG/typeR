library(analogue)


### Name: weightedCor
### Title: Weighted correlation test of WA reconstruction
### Aliases: weightedCor weightedCor.default print.weightedCor
###   plot.weightedCor
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ImbrieKipp, SumSST, V12.122)

Cor <- weightedCor(ImbrieKipp, env = SumSST,
                   fossil = V12.122, type = "simulate", sim = 49)
Cor

plot(Cor)
plot(Cor, type = "null")



