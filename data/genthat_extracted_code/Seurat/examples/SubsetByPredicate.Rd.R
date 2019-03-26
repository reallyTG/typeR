library(Seurat)


### Name: SubsetByPredicate
### Title: Return a subset of the Seurat object.
### Aliases: SubsetByPredicate

### ** Examples

pbmc1 <- SubsetByPredicate(object = pbmc_small,
                      vars.use = c("nUMI", "res.1"),
                      predicate = "nUMI < 200 & res.1=='3'")
pbmc1




