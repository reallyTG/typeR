library(DTComPair)


### Name: sesp.mcnemar
### Title: McNemar Test for Comparison of Sensitivities and Specificities
### Aliases: sesp.mcnemar

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
mcnem.results <- sesp.mcnemar(paired.layout)
str(mcnem.results)
mcnem.results
mcnem.results$sensitivity["p.value"]



