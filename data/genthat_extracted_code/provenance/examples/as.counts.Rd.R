library(provenance)


### Name: as.counts
### Title: create a 'counts' object
### Aliases: as.counts

### ** Examples

X <- matrix(c(0,100,0,30,11,2,94,36,0),nrow=3,ncol=3)
rownames(X) <- 1:3
colnames(X) <- c('a','b','c')
comp <- as.counts(X)
d <- diss(comp)



