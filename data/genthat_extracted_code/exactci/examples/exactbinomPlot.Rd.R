library(exactci)


### Name: exactbinomPlot
### Title: Plot p-value function for one binomial response.
### Aliases: exactbinomPlot
### Keywords: hplot

### ** Examples

## plot central two-sided p-values (double one-sided p-values)
## for 5 positive responses out of 17 tries
exactbinomPlot(5,17)
## add blakers exact p-values
## pch option acts on points, lty acts on ci lines
exactbinomPlot(5,17,tsmethod="blaker",col="blue",pch=".",lty=2,newplot=FALSE)

## can plot one-sided p-values, tsmethod is ignored
exactbinomPlot(5,17,alternative="less")




