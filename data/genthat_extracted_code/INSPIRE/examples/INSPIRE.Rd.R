library(INSPIRE)


### Name: INSPIRE
### Title: Inferring Shared Modules from Multiple Gene Expression Datasets
###   with Partially Overlapping Gene Sets
### Aliases: INSPIRE

### ** Examples

## Not run: 
##D library(INSPIRE)
##D mcnt = 90 #module size
##D lambda = .1 #penalty parameter to induce sparsity
##D # download two real gene expression datasets, where the rows are genes and columns are samples
##D data('two_example_datasets')
##D # log-normalize, and standardize each dataset
##D res = INSPIRE(list(scale(log(exmp_dataset1)), scale(log(exmp_dataset2))), mcnt, lambda)
## End(Not run)



