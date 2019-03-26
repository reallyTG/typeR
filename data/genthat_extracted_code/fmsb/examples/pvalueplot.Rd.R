library(fmsb)


### Name: pvalueplot
### Title: Drawing p-value function plot by a cross table
### Aliases: pvalueplot

### ** Examples

pvalueplot(matrix(c(321, 411, 686-321, 689-411), 2, 2), xrange=c(0.7, 0.9))
pvalueplot(matrix(c(4, 386, 4, 1250), 2, 2), xrange=c(0.1, 20), plot.log=TRUE)
pvalueplot(matrix(c(468, 480, 229, 205), 2, 2), plot.OR=TRUE, xrange=c(0.7, 1.0))



