library(disco)


### Name: corOrt
### Title: Calculate ortholog gene correlation coefficients
### Aliases: corOrt

### ** Examples

library(tmod)
data(tmod)
data(orthologs)
a <- corOrt(orthologs)
disco <- disco.score(orthologs)
ord <- order(disco, decreasing = TRUE)
concordant <- tmodCERNOtest(toupper(orthologs$genes)[ord])
corOrt(orthologs, g=tmod[concordant$ID])



