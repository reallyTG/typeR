library(qtlcharts)


### Name: estQTLeffects
### Title: Calculate QTL effects at each position across the genome
### Aliases: estQTLeffects
### Keywords: regression

### ** Examples

data(grav)
library(qtl)
grav <- reduce2grid(calc.genoprob(grav, step=1))
out <- estQTLeffects(grav, phe=seq(1, nphe(grav), by=5))




