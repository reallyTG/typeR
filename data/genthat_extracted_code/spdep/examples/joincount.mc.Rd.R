library(spdep)


### Name: joincount.mc
### Title: Permutation test for same colour join count statistics
### Aliases: joincount.mc
### Keywords: spatial

### ** Examples

data(oldcol)
HICRIME <- cut(COL.OLD$CRIME, breaks=c(0,35,80), labels=c("low","high"))
names(HICRIME) <- rownames(COL.OLD)
joincount.mc(HICRIME, nb2listw(COL.nb, style="B"), nsim=99)
joincount.test(HICRIME, nb2listw(COL.nb, style="B"))



