library(empirical)


### Name: comb.prob
### Title: Compute Probabilities
### Aliases: comb.prob

### ** Examples

data (trees)
attach (trees)
ecdfmv.f = ecdfmv (cbind (Height, Volume) )
a = c (0, 0)
b = c (80, 30)
comb.prob (ecdfmv.f, a, b)



