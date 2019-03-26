library(nsRFA)


### Name: GOFlaio2004
### Title: Goodness of fit tests
### Aliases: GOFlaio2004 A2_GOFlaio A2 W2 fw2
### Keywords: htest

### ** Examples

sm <- rand.gumb(100, 0, 1)
ml <- ML_estimation (sm, dist="GEV"); ml
F.GEV(sm, ml[1], ml[2], ml[3])
A2(sort(F.GEV(sm, ml[1], ml[2], ml[3])))
A2_GOFlaio(sm, dist="GEV")

ml <- ML_estimation (sm, dist="P3"); ml
A2(sort(sort(F.gamma(sm, ml[1], ml[2], ml[3]))))
A2_GOFlaio(sm, dist="P3")



