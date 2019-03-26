library(lmomco)


### Name: freq.curve.all
### Title: Compute Frequency Curve for Almost All Distributions
### Aliases: freq.curve.all
### Keywords: misc

### ** Examples

L <- vec2lmom(c(35612,23593,0.48,0.21,0.11))
Qtable1 <- freq.curve.all(L, step=TRUE, no2para=TRUE, no4para=TRUE)
## Not run: 
##D Qtable2 <- freq.curve.all(L, gld=TRUE, show=TRUE)
## End(Not run)



