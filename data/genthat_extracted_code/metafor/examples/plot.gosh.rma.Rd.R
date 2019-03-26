library(metafor)


### Name: plot.gosh.rma
### Title: Plot Method for 'gosh.rma' Objects
### Aliases: plot.gosh.rma
### Keywords: hplot

### ** Examples

### meta-analysis of all trials including ISIS-4 using a FE model
res <- rma(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat.egger2001, method="FE")

## Not run: 
##D ### fit FE model to all possible subsets (65535 models)
##D sav <- gosh(res)
##D 
##D ### create GOSH plot
##D ### red points for subsets that include and blue points
##D ### for subsets that exclude study 16 (the ISIS-4 trial)
##D plot(sav, out=16, breaks=100, adjust=.3)
## End(Not run)



