library(simone)


### Name: simone
### Title: SIMoNe algorithm for network inference
### Aliases: simone
### Keywords: htest

### ** Examples

## load the breast cancer data set
data(cancer)
attach(cancer)

## launch simone with the default parameters and plot results
plot(simone(expr))

## Not run: 
##D ## try with clustering now (clustering is achieved on a 30-edges network)
##D plot(simone(expr, clustering=TRUE, control=setOptions(clusters.crit=30)))
##D 
##D ## try the multiple sample
##D plot(simone(expr, tasks=status))
## End(Not run)

detach(cancer)



