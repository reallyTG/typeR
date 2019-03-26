library(TropFishR)


### Name: lfqFitCurves
### Title: Fitting VBGF growth curves through lfq data
### Aliases: lfqFitCurves

### ** Examples

data(synLFQ5)
res <- lfqRestructure(synLFQ5, MA=11)
plot(res)
tmp <- lfqFitCurves(res, par=list(Linf=80,K=0.5,t_anchor=0.25), draw=TRUE)




