library(DTComPair)


### Name: pv.gs
### Title: Generalized Score Statistic for Comparison of Predictive Values
### Aliases: pv.gs

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
gs.results <- pv.gs(paired.layout)
str(gs.results)
gs.results
gs.results$ppv["p.value"]



