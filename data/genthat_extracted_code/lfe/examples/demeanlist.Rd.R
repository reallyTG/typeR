library(lfe)


### Name: demeanlist
### Title: Centre vectors on multiple groups
### Aliases: demeanlist

### ** Examples

oldopts <- options(lfe.threads=1)
## create a matrix
mtx <- data.frame(matrix(rnorm(999),ncol=3))
# a list of factors
rgb <- c('red','green','blue')
fl <- replicate(4, factor(sample(rgb,nrow(mtx),replace=TRUE)), simplify=FALSE)
names(fl) <- paste('g',seq_along(fl),sep='')
# centre on all means
mtx0 <- demeanlist(mtx,fl)
head(data.frame(mtx0,fl))
# verify that the group means for the columns are zero
lapply(fl, function(f) apply(mtx0,2,tapply,f,mean))
options(oldopts)



