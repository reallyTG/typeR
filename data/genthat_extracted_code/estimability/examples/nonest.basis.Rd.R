library(estimability)


### Name: nonest.basis
### Title: Estimability Tools
### Aliases: nonest.basis nonest.basis.qr nonest.basis.matrix
###   nonest.basis.lm all.estble is.estble
### Keywords: models regression

### ** Examples

require(estimability)

X <- cbind(rep(1,5), 1:5, 5:1, 2:6)
( nb <- nonest.basis(X) )

# Test estimability of some linear functions for this X matrix
lfs <- rbind(c(1,4,2,5), c(2,3,9,5), c(1,2,2,1), c(0,1,-1,1))
is.estble(lfs, nb)

# Illustration on 'lm' objects:
warp.lm1 <- lm(breaks ~ wool * tension, data = warpbreaks, 
    subset = -(26:38), 
    contrasts = list(wool = "contr.treatment", tension = "contr.treatment"))
zapsmall(nonest.basis(warp.lm1))

warp.lm2 <- update(warp.lm1, 
    contrasts = list(wool = "contr.sum", tension = "contr.helmert"))
zapsmall(nonest.basis(warp.lm2))



