library(neat)


### Name: summary.neat
### Title: Summary method of 'neat'
### Aliases: summary.neat
### Keywords: methods

### ** Examples

## Not run: 
##D data(yeast)
##D esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
##D test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
##D             nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
##D 
##D test1 = test[1:99,]
##D summary(test1)
##D 
##D test2 = test[100:198,]
##D summary(test2)
## End(Not run)


