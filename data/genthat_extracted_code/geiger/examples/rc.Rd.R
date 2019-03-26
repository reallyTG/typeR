library(geiger)


### Name: rc
### Title: relative cladogenesis test
### Aliases: rc
### Keywords: arith

### ** Examples


geo <- get(data(geospiza))

## WITHOUT BONFERRONI CORRECTION
rc(geo$phy)

## WITH BONFERRONI CORRECTION and ALPHA=0.15
rc(geo$phy, bonf=TRUE, p.cutoff=0.15)




