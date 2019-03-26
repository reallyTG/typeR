library(disco)


### Name: modCor
### Title: Calculate correlation between regulation of orthologous genes in
###   a chosen gene set
### Aliases: modCor

### ** Examples

library(tmod)
data(tmod)
data(orthologs)

genes <- tmod$MODULES2GENES[["LI.M0"]]
a <- modCor(orthologs, genes)

# Using tmod objects directly
a <- modCor(orthologs, tmod[c("LI.M0", "LI.M1.0")], "spearman")



