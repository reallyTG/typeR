library(pensim)


### Name: beer.exprs
### Title: Lung adenocarcinoma microarray expression data of Beer et al.
###   (2002)
### Aliases: beer.exprs
### Keywords: datasets

### ** Examples

data(beer.exprs)
mysd <- apply(beer.exprs, 1, sd)
beer.subset <- as.matrix(beer.exprs[rank(-mysd) <= 100, ])  
heatmap(beer.subset)



