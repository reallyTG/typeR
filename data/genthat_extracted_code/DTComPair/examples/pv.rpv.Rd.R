library(DTComPair)


### Name: pv.rpv
### Title: Comparison of Predictive Values using Relative Predictive Values
### Aliases: pv.rpv

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
rpv.results <- pv.rpv(paired.layout)
str(rpv.results)
rpv.results
rpv.results$ppv["p.value"]



