library(amap)


### Name: afc
### Title: Correspondance factorial analysis.
### Aliases: afc
### Keywords: multivariate

### ** Examples

## Not run: 
##D color <- as.factor(c('blue','red','red','blue','red'))
##D size <- as.factor(c('large','large','small','medium','large'))
##D x <- data.frame(color,size)
##D 
##D afc.1 <- afc(burt(x))
##D afc.2 <- afc(matlogic(x))
##D 
##D plotAll(afc.1)
##D plotAll(afc.2)
## End(Not run)



