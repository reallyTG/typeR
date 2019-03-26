library(shotGroups)


### Name: analyzeGroup
### Title: Analysis for a single group of bullet holes
### Aliases: analyzeGroup

### ** Examples

data(DFinch)

# select combined data from only first 2 series
DF  <- subset(DFinch, series %in% 1:2)
res <- analyzeGroup(DF, conversion='yd2in', bootCI='none')
names(res)
res$multNorm
res$corXY
res$ctrRob
res$ctrXci
res$ctrYci



