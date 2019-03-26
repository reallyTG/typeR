library(aSPU)


### Name: plotPmat
### Title: Image plot of P-value matrix.
### Aliases: plotPmat

### ** Examples

## Say we have 3 traits and their p-values at 5 SNPs. 
Ps <- rbind( c(0.001, 0.4, 0.5, 0.00000001, .1),
           c(0.03, 0.3, 0.3, 0.00001, .2),
           c(0.01, 0.2, 0.4, 0.001, .0001) )

## We can visualize it using plotPmat function.
plotPmat(Ps)





