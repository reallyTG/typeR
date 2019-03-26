library(pointRes)


### Name: res.comp
### Title: Calculate resilience components: resistance, recovery,
###   resilience and relative resilience
### Aliases: res.comp

### ** Examples

## Calculate resilience components on tree-ring series
data(s033)
res <- res.comp(s033, nb.yrs = 4, post = NULL, res.thresh.neg = 40, series.thresh = 75)
res$out
res$out.select




