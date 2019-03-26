library(NMF)


### Name: silhouette.NMF
### Title: Silhouette of NMF Clustering
### Aliases: silhouette.NMF

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

x <- rmatrix(100, 20, dimnames = list(paste0('a', 1:100), letters[1:20]))
# NB: using low value for maxIter for the example purpose only
res <- nmf(x, 4, nrun = 5, maxIter = 50)

# sample clustering from best fit
plot(silhouette(res))

# from consensus
plot(silhouette(res, what = 'consensus'))

# feature clustering
plot(silhouette(res, what = 'features'))

# average silhouette are computed in summary measures
summary(res)

# consensus silhouettes are ordered as on default consensusmap heatmap
## Not run:  op <- par(mfrow = c(1,2)) 
consensusmap(res)
si <- silhouette(res, what = 'consensus')
plot(si)
## Not run:  par(op) 

# if the order is based on some custom numeric weights
## Not run:  op <- par(mfrow = c(1,2)) 
cm <- consensusmap(res, Rowv = runif(ncol(res)))
# NB: use reverse order because silhouettes are plotted top-down
si <- silhouette(res, what = 'consensus', order = rev(cm$rowInd))
plot(si)
## Not run:  par(op) 

# do the reverse: order the heatmap as a set of silhouettes
si <- silhouette(res, what = 'features')
## Not run:  op <- par(mfrow = c(1,2)) 
basismap(res, Rowv = si)
plot(si)
## Not run:  par(op) 



