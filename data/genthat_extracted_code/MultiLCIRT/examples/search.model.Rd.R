library(MultiLCIRT)


### Name: search.model
### Title: Search for the global maximum of the log-likelihood
### Aliases: search.model
### Keywords: model selection

### ** Examples

## Not run: 
##D ## Search Multidimensional LC IRT models for binary responses
##D # Aggregate data
##D data(naep)
##D X = as.matrix(naep)
##D out = aggr_data(X)
##D S = out$data_dis
##D yv = out$freq
##D # Define matrix to allocate each item on one dimension 
##D multi1 = rbind(c(1,2,9,10),c(3,5,8,11),c(4,6,7,12))
##D out2 = search.model(S, yv = yv, kv=c(1:4),multi=multi1)
## End(Not run)



