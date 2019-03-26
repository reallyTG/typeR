library(sampSurf)


### Name: standingTreeIZs
### Title: Generate Objects of Class "'standingTreeIZs'"
### Aliases: standingTreeIZs
### Keywords: ~kwd1 ~kwd2

### ** Examples

sts = standingTrees(4, units='English', heights=c(10,30))
sts.cp = lapply(sts@trees, 'circularPlotIZ', plotRadius=20)
izs.cp = standingTreeIZs(sts.cp)
bbox(izs.cp)
plot(izs.cp, axes=TRUE)



