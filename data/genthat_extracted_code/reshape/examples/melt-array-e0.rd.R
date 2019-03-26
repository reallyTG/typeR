library(reshape)


### Name: melt.array
### Title: Melt an array
### Aliases: melt.array melt.matrix melt.table
### Keywords: manip

### ** Examples
a <- array(1:24, c(2,3,4))
melt(a)
melt(a, varnames=c("X","Y","Z"))
dimnames(a) <- lapply(dim(a), function(x) LETTERS[1:x])
melt(a)
melt(a, varnames=c("X","Y","Z"))
dimnames(a)[1] <- list(NULL)
melt(a)


