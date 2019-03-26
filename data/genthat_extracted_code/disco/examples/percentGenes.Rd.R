library(disco)


### Name: percentGenes
### Title: Calculates percentage of present genes from a specified superset
###   of expression modules
### Aliases: percentGenes

### ** Examples

library(tmod)
data(tmod)
data(orthologs)
disco <- disco.score(orthologs)
ord <- order(disco, decreasing = TRUE)
concordant <- tmodCERNOtest(toupper(orthologs$genes)[ord])
modtable <- percentGenes(orthologs, tmod[concordant$ID])
cbind(concordant, modtable)



