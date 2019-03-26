library(qgraph)


### Name: cor_auto
### Title: Automatically compute an apppropriate correlation matrix
### Aliases: cor_auto

### ** Examples

## Not run: 
##D ### Examples from lavCor (lavaan): ###
##D 
##D library("lavaan")
##D 
##D # Holzinger and Swineford (1939) example
##D HS9 <- HolzingerSwineford1939[,c("x1","x2","x3","x4","x5",
##D                                  "x6","x7","x8","x9")]
##D 
##D # Pearson correlations
##D cor_auto(HS9)
##D 
##D # ordinal version, with three categories
##D HS9ord <- as.data.frame( lapply(HS9, cut, 3, labels=FALSE) )
##D 
##D # polychoric correlations, two-stage estimation
##D cor_auto(HS9ord)
## End(Not run)



