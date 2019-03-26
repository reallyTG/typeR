library(caRpools)


### Name: unmapped.genes
### Title: sgRNAs without reads
### Aliases: unmapped.genes
### Keywords: ~Analysis

### ** Examples

data(caRpools)
U1.unmapped = unmapped.genes(data=CONTROL1, namecolumn=1,
fullmatchcolumn=2, genes=NULL, extractpattern=expression("^(.+?)_.+"))

knitr::kable(U1.unmapped)

U1.unmapped = unmapped.genes(data=CONTROL1, namecolumn=1,
fullmatchcolumn=2, genes="random", extractpattern=expression("^(.+?)_.+"))

knitr::kable(U1.unmapped)



