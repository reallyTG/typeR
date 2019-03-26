library(agridat)


### Name: bond.diallel
### Title: Diallel cross of winter beans
### Aliases: bond.diallel
### Keywords: datasets

### ** Examples


data(bond.diallel)
dat <- bond.diallel

require(lattice)
splom(dat[,3:11], main="bond.diallel")

# Needs an example.  Bond says yield heterosis of F1 hybrids over parent
# means is 22.56, but I cannot match.

# See man page for FDdata in R package sommer




