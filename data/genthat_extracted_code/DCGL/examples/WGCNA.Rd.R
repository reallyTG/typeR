library(DCGL)


### Name: WGCNA
### Title: Identify DCGs (Differential Coexpressed Genes) based on the
###   'Weighted Gene Coexpression Network Analysis'
### Aliases: WGCNA
### Keywords: DCGs

### ** Examples

data(exprs)
WGCNA(exprs[1:100,1:16],exprs[1:100,17:63],power=12,variant='WGCNA')



