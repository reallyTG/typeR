library(climdex.pcic)


### Name: threshold.exceedance.duration.index
### Title: Sum of spell lengths exceeding daily threshold
### Aliases: threshold.exceedance.duration.index
### Keywords: climate ts

### ** Examples


prec.dat <- c(0.1, 3.0, 4.3, 1.9, 1.3, 6.0, 0, 0, 4.0, 1)
phony.date.factor <- factor(rep(1:2, each=5))

## With spells spanning years...
alttedi <- threshold.exceedance.duration.index(prec.dat,
phony.date.factor, rep(1:5, 2), rep(1, 5), ">=", 2, TRUE, 1)

## Without spells spanning years...
tedi <- threshold.exceedance.duration.index(prec.dat, phony.date.factor,
rep(1:5, 2), rep(1, 5), ">=", 2, FALSE, 1)




