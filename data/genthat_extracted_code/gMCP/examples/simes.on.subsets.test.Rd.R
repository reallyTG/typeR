library(gMCP)


### Name: simes.on.subsets.test
### Title: Simes on subsets, otherwise Bonferroni
### Aliases: simes.on.subsets.test

### ** Examples


simes.on.subsets.test(pvalues=c(0.1,0.2,0.05), weights=c(0.5,0.5,0))
simes.on.subsets.test(pvalues=c(0.1,0.2,0.05), weights=c(0.5,0.5,0), adjPValues=FALSE)

graph <- BonferroniHolm(4)
pvalues <- c(0.01, 0.05, 0.03, 0.02)

gMCP.extended(graph=graph, pvalues=pvalues, test=simes.on.subsets.test, subsets=list(1:2, 3:4))




