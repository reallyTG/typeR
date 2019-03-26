library(neat)


### Name: yeast
### Title: List collecting various yeast data (see 'description')
### Aliases: yeast
### Keywords: datasets

### ** Examples

## Not run: 
##D data(yeast)
##D esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
##D test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
##D             nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
##D # Replace with "blist = yeast$kegg" to use kegg pathways
##D 
##D m = dim(test)[1]
##D test1 = test[1:(m/2),]
##D o1=test1[test1$conclusion=='Overenrichment',]
##D # list of overenrichments for the first ESR set:
##D print(o1, nrows='ALL') 
##D 
##D test2 = test[(m/2+1):m,]
##D o2=test2[test2$conclusion=='Overenrichment',]
##D # list of overenrichments for the second ESR set:
##D print(o2, nrows='ALL')
##D 
##D # the same can be done using KEGG pathways:
##D keggtest = neat(alist = esr, blist = yeast$kegg, network = yeast$yeastnet,
##D             nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
## End(Not run)


