library(TDCor)


### Name: clean.at
### Title: Elimininate from a vector of gene codes the genes for which no
###   data is available.
### Aliases: clean.at
### Keywords: Side functions

### ** Examples

## Load lateral root transcriptomic dataset and the l_genes vector
data(LR_dataset)
data(l_genes)

# Clean the l_gene vector 
clean.at(LR_dataset,l_genes)




