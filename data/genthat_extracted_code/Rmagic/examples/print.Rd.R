library(Rmagic)


### Name: print.magic
### Title: Print a MAGIC object
### Aliases: print.magic

### ** Examples

if (reticulate::py_module_available("magic")) {

data(magic_testdata)
data_magic <- magic(magic_testdata)
print(data_magic)
## MAGIC with elements
## $result : (500, 197)
## $operator : Python MAGIC operator
## $params : list with elements (data, k, alpha, t, npca, knn.dist.method)

}



