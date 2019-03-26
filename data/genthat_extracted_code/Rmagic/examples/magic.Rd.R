library(Rmagic)


### Name: magic
### Title: Perform MAGIC on a data matrix
### Aliases: magic

### ** Examples

if (reticulate::py_module_available("magic")) {

data(magic_testdata)

# Run MAGIC
data_magic <- magic(magic_testdata, genes=c("VIM", "CDH1", "ZEB1"))
summary(data_magic)
##       CDH1             VIM             ZEB1
## Min.   :0.4303   Min.   :3.854   Min.   :0.01111
## 1st Qu.:0.4444   1st Qu.:3.947   1st Qu.:0.01145
## Median :0.4462   Median :3.964   Median :0.01153
## Mean   :0.4461   Mean   :3.965   Mean   :0.01152
## 3rd Qu.:0.4478   3rd Qu.:3.982   3rd Qu.:0.01160
## Max.   :0.4585   Max.   :4.127   Max.   :0.01201

# Plot the result with ggplot2
if (require(ggplot2)) {
  ggplot(data_magic) +
    geom_point(aes(x=VIM, y=CDH1, color=ZEB1))
}

# Run MAGIC again returning all genes
# We use the last run as initialization
data_magic <- magic(magic_testdata, genes="all_genes", init=data_magic)
# Extract the smoothed data matrix to use in downstream analysis
data_smooth <- as.matrix(data_magic)

}




