library(DTComPair)


### Name: sesp.exactbinom
### Title: Exact Binomial Test for Differences in Sensitivity and
###   Specificity
### Aliases: sesp.exactbinom

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
exact.results <- sesp.exactbinom(paired.layout)
str(exact.results)
exact.results
exact.results$sensitivity["p.value"]



