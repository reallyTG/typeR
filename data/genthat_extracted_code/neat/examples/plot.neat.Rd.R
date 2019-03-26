library(neat)


### Name: plot.neat
### Title: Plot method of 'neat'
### Aliases: plot.neat
### Keywords: methods

### ** Examples

## Not run: 
##D data(yeast)
##D esr2 = list('ESR 2' = yeast$esr2)
##D 
##D test = neat(alist = esr2, blist = yeast$goslimproc, network = yeast$yeastnet, 
##D             nettype='undirected', nodes = yeast$ynetgenes, alpha = 0.01)
##D 
##D plot(test)
## End(Not run)


