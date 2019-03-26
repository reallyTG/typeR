library(spc)


### Name: lns2ewma.crit
### Title: Compute critical values of EWMA ln S^2 control charts (variance
###   charts)
### Aliases: lns2ewma.crit
### Keywords: ts

### ** Examples

## Knoth (2005)
## compare with Table 3 (p. 351)
L0 <- 200
l <- .05
df <- 4
limits <- lns2ewma.crit(l, L0, df, cl=0, hs=0)
limits["cu"]



