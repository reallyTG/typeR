library(utiml)


### Name: fill_sparse_mldata
### Title: Fill sparse dataset with 0 or " values
### Aliases: fill_sparse_mldata

### ** Examples

sparse.toy <- toyml
sparse.toy$dataset$ratt10[sample(100, 30)] <- NA
complete.toy <- fill_sparse_mldata(sparse.toy)



