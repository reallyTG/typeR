library(DTComPair)


### Name: pv.wgs
### Title: Weighted Generalized Score Statistic for Comparison of
###   Predictive Values
### Aliases: pv.wgs

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
wgs.results <- pv.wgs(paired.layout)
str(wgs.results)
wgs.results
wgs.results$ppv["p.value"]



